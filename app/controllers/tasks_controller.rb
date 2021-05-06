class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  

  def index
    @tasks = @project.tasks
    @taskss = Task.search(params[:search])
  end

  
  def show
  end

 
  def new
    @task = @project.tasks.build
    
  end

  
  def edit
  end

 
  def create
    @task = @project.tasks.build(task_params)
      if @task.save
        redirect_to(@task.project)
      else
        render action: 'new'
      end
  end



  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  

 
  def destroy
    @task.destroy
    redirect_to project_tasks_url(@project)
  end

  private
   
    def set_project
      @project = current_user.projects.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :is_done, :project_id, :search, :tag_ids => [])
    end
 
end

