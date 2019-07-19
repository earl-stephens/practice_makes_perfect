require "rails_helper"

RSpec.describe Member, type: :model do
  it 'exists' do
    data = {name: 'whatever', id: '3'}
    member = Member.new(data)

    expect(member).to be_an_instance_of(Member)
    expect(member.name).to eq(data[:name])
  end
end
