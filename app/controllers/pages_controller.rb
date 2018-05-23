class PagesController < ApplicationController
  layout 'admin'

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Successfully create new page"
      redirect_to(pages_path)
    else
      redirect_to(new_page_path)
    end
  end

  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully update '#{@page.name}'"
      redirect_to(page_path(@page))
    else
      redirect_to(edit_page_path(@page))
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroy '#{@page.name}'"
    redirect_to(pages_path)
  end

private
  def page_params
    params.require(:page).permit(:name, :visible, :subject_id, :permalink, :position)
  end
end
