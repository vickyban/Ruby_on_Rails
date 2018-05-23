class SubjectsController < ApplicationController
  layout 'admin'

  def index
    @subjects = Subject.sorted
    #@page_title = "All Subjects"  better to put in template where rendering the view is the prime focus
  end

  def show
    @subject = Subject.find( params[:id] )
  end

  def new
    @subject = Subject.new({:name => "default"}) # allow to set default value or display default value from the db
  end

  def create
    #@subject = Subject.new(params[:subject])  # subject from new action that has been assign values but Mass Assignment is not allowed by default
    @subject = Subject.new(subject_params) #pass in permited version of subject params to be assigned
    if @subject.save
      flash[:notice] = "Subject created succesfully"
      redirect_to(subjects_path)
    else
      render('new')

    end
  end

  def edit
    @subject = Subject.find( params[:id] )
  end

  def update
    @subject = Subject.find( params[:id] )
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subjet updated succesfully"
      redirect_to(subject_path(@subject))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully"
    redirect_to(subjects_path)
  end

private 
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
