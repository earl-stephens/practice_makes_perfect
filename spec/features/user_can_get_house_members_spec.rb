require "rails_helper"

RSpec.describe 'a user can get info for', type: :feature do
  it 'all of the greyjoy house members' do
# As a user
# When I visit "/"
    visit '/'
    save_and_open_page
# And I select "Greyjoy" from the dropdown
    fill_in :q, with: 'Greyjoy'
# And I click on "Get Members"
    click_on 'Get Members'
# Then my path should be "/search" with "house=greyjoy" in the parameters
    expect(current_path).to eq('/search')
    expect(current_url).to include('house=greyjoy')
# And I should see a message "7 Members"
    expect(page).to have_content('7 Members')
# And I should see a list of the 7 members of House Greyjoy
    expect(page).to have_css('.house_members', count: 7)
# And I should see a name and id for each member.
    within(first('.house_members')) do
      expect(page).to have_css('.house_member_name')
      expect(page).to have_css('.house_member_id')
    end
  end
end
