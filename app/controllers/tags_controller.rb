class TagsController < ApplicationController
  before_action :set_project
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET projects/1/tags
  def index
    @tags = @project.tags
  end

  # GET projects/1/tags/1
  def show
  end

  # GET projects/1/tags/new
  def new
    @tag = @project.tags.build
  end

  # GET projects/1/tags/1/edit
  def edit
  end

  # POST projects/1/tags
  def create
    @tag = @project.tags.build(tag_params)
raise
    if @tag.save
      redirect_to(@tag.project)
    else
      render action: 'new'
    end
  end

  # PUT projects/1/tags/1
  def update
    
 @task = @project.tags.build(tag_params)

    if @tags.save
      redirect_to(@task.project)
    else
      render action: 'new'
    end
  end
  # DELETE projects/1/tags/1
  def destroy
    @tag.destroy

    redirect_to project_tags_url(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_tag
      @tag = @project.tags.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:title, :project_id)
      
    end
end
