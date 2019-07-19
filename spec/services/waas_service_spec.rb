require "rails_helper"

RSpec.describe 'can make an api call' do
  it 'to get a listing of houses' do
    search_term = 'greyjoy'
    service = WaasService.new(search_term)
# binding.pry
    results = service.get_house_id

    expect(results).to be_an Array
    expect(results.count).to eq(5)
  end

  it 'can match an id to a house' do
    search_term = 'Greyjoy'
    service = WaasService.new(search_term)

    url = "/api/v1/house/5"

    house_info = service.get_json(url)

    expect(house_info.count).to eq(7)
  end
end
