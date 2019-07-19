class Member
  attr_reader :name,
              :id

  def initialize(member_data)
    @name = member_data[:name]
    @id = member_data[:id]
  end

end
