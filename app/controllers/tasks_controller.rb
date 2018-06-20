class TasksController < ApplicationController
  before_action :set_task, only:[:show,:edit,:update,:destroy]
  
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "保存しました！"
      redirect_to @task
    else
      flash.now[:danger] = "失敗……"
      render :new
    end
  end
  
  def edit
  end
  
  def show
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスク変更しました！"
      redirect_to @task
    else
      flash.now[:danger] = "失敗……"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "削除しました"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content,:status)
  end
  
end
