class ApiService

  def initialize(search_params)
    @search_term = search_params
  end

  def conn
    Faraday.new("http://westerosapi.herokuapp.com") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    binding.pry
    results = JSON.parse(response.body, symbolize_names: true)
  end

end
