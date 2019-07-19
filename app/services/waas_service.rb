class WaasService

  # def initialize(search_params)
  #   @search_term = search_params
  # end

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

  def find_house_id(search_term)
    house_id = 0
    get_house_id.each do |house|
      if house[:name] == search_term
        house_id = house[:id]
      end
    end
    house_id
  end

  def get_json(url, id)
    house_id = '/' + find_house_id(id).to_s
    new_url = url + house_id
    response = conn.get(new_url)
    results = JSON.parse(response.body, symbolize_names: true)
  end

end
