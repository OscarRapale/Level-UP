class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: [:update, :destroy]
  
    def index
      @tasks = current_user.tasks
    end
  
    def create
      @task = current_user.tasks.new(task_params)
  
      if @task.save
        render json: @task, status: :created
      else
        render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @task.update(task_params)
        render json: @task
      else
        render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @task.destroy
        head :no_content
      else
        render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def complete
      @task = current_user.tasks.find(params[:id])
      if @task.update(completed: true)
        xp_gained = rand(75..110)
        current_user.gain_xp(xp_gained)
        render json: @task
      else
        render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_task
      @task = current_user.tasks.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :completed)
    end
  end
  