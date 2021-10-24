class StudiesController < ApplicationController
  
  before_action :set_study, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    if @study.update(study_params)
      redirect_to study_path(@study.id)
    else
      render :edit
    end
  end

  def destroy
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

  def move_to_index
    redirect_to root_path unless current_user.id == @study.user_id
  end

  def set_study
    @study = Study.find(params[:id])
  end

end
