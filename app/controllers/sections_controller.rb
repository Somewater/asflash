class SectionsController < ApplicationController

  PORTFOLIO_PER_PAGE = 10

  def index
    redirect_to section_path(Section.find_by_name(Section::PORTFOLIO_NAME))
  end

  [:portfolio, :resume, :contacts].each do |method|
    define_method method.to_s + '_legacy' do
      @section = Section.find_by_name(Section.const_get(method.to_s.upcase << '_NAME'))
      @page_number = 0
      render_section
    end
  end
  
  def show
    @section = (params[:id] || params[:section_id] ? Section.find_by_name(params[:id] || params[:section_id]) : nil)
    @page_number = [(params[:page] || '0').to_i, 0].max
    if @section && @section.main?
      redirect_to root_path
    else
      render_section()
    end
  end
  
  protected
  def render_section
    if !@section
      render 'main_page/not_found'
    else
      @page = TextPage.find_all_by_section_id(@section.id).first
      render 'sections/show'
    end
  end
end
