class WaasService

  def initialize(search_params)
    @search_term = search_params
  end

  def conn
    Faraday.new("https://westeros-as-a-service.herokuapp.com") do |f|
      f.headers['x-api-key'] = ENV['waas_key']
      f.adapter Faraday.default_adapter
    end
  end

  def get_house_id
    response = conn.get("/api/v1/house")
    results = JSON.parse(response.body, symbolize_names: true)
    # binding.pry
  end

  def find_house_id
    house_id = 0
    get_house_id.each do |house|
      if house[:name] == @search_term
        house_id = house[:id]
      end
    end
    house_id
  end

  def get_json(url)
    find_house_id
    # binding.pry
    response = conn.get(url)
    results = JSON.parse(response.body, symbolize_names: true)
  end

end
