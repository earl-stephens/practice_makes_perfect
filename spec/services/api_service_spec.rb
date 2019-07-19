require "rails_helper"

RSpec.describe 'can make an api call' do
  it 'and get the right data back' do
    search_term = 'greyjoy'
    service = ApiService.new(search_term)
    url = "/api/v1/house/#{@search_term}?api_key=#{ENV['api_key']}"
    results = service.get_json(url)

    expect(results).to be_a Hash
  end
end
