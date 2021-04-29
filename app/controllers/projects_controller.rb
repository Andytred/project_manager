class ProjectsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  
  
  def index
    @pagy, @projects = pagy(current_user.projects)
    
  end

 
  def show
    @task = @project.tasks.build
    
  end

  
  def new
   
    @project = current_user.projects.build
  end

  
  def edit
     
  end

 
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
    
    def set_project
      @project = current_user.projects.find(params[:id])
    end

 
    def project_params
      params.require(:project).permit(:title, :position)
    end
end