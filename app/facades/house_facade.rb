class HouseFacade
  attr_reader :search_term

  def initialize(search_params)
    @search_term = search_params
  end

  def total_members
    conn = Faraday.new("http://westerosapi.herokuapp.com") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/api/v1/house/#{@search_term}?api_key=#{ENV['api_key']}")
    results = JSON.parse(response.body, symbolize_names: true)
    results[:data][0][:attributes][:members].count
  end

  def member_data
    conn = Faraday.new("http://westerosapi.herokuapp.com") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("/api/v1/house/#{@search_term}?api_key=#{ENV['api_key']}")
    results = JSON.parse(response.body, symbolize_names: true)
    results[:data][0][:attributes][:members].map do |individual_member|
      Member.new(individual_member)
    end
  end

end
