class HouseFacade
  attr_reader :search_term

  def initialize(search_params)
    @search_term = search_params
  end

  def total_members
    results = get_json
    results[:data][0][:attributes][:members].count
  end

  def member_data
    results = get_json
    results[:data][0][:attributes][:members].map do |individual_member|
      Member.new(individual_member)
    end
  end

  private

  # def service
  #   @_service ||= ApiService.new(@search_term)
  # end
  #
  # def get_json
  #   @_get_json ||= service.get_json("/api/v1/house/#{@search_term}?api_key=#{ENV['api_key']}")
  # end

  def service
    @_service ||= WaasService.new(@search_term)
  end

end
