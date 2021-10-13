class StudiesController < ApplicationController

  def index
    @studies = Study.all.order('created_at DESC')
  end
  
  def new
    @study = Study.new
  end

  def create
    @study = Study.new(study_params)
    if @study.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @study = Study.find(params[:id])
  end

  def edit
    @study = Study.find(params[:id])
  end

  def update
    @study = Study.find(params[:id])
    if @study.update(study_params)
      redirect_to study_path(@study.id)
    else
      render :edit
    end
  end

  def destroy
    @study = Study.find(params[:id])
    @study.destroy
    redirect_to root_path
  end

  def search
    @studies = Study.search(params[:keyword])
  end
  
  private

  def study_params
    params.require(:study).permit(:title, :language, :framework, :content).merge(user_id: current_user.id)
  end


end
