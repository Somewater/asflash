class SectionsController < ApplicationController
  
  def index
    @section = Section.main
    @page_number = 0
    render_section()
  end
  
  def show
    @section = (params[:id] || params[:section_id] ? Section.find_by_name(params[:id] || params[:section_id]) : nil)
    @page_number = [(params[:page] || '1').to_i, 1].max - 1
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
