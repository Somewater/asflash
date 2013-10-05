class MainPageController < ApplicationController
  def index
    redirect_to section_path(Section.find_by_name(Section::PORTFOLIO_NAME))
  end

  def not_found
  end
end
