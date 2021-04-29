class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  
  def index
    @tag = Tag.all
    
  end
  
  def show
    @tag = Tag.find(params[:id])
    
  end


  def new
    @project = Project.find(params[:project_id])
    @tag = Tag.new
    @tag.save
  end
 
  def edit
    @tag = Tag.find(params[:id])
  end


  def create
    @tag = Tag.new(tag_params)
    @project = Project.find(params[:project_id])
    @tag.project = @project
      if @tag.save
      redirect_to project_tags_url(@project)
      else
        render :new
    end
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to project_task_tag_path(@tag)
    end
 
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to project_path(@tag.project)
  end


  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title)
  end
  
end
