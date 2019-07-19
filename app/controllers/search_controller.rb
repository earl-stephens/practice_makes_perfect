class SearchController < ApplicationController

  def index
    # binding.pry
    render locals: { facade:
                    HouseFacade.new(params[:house])
                  }
  end

end
