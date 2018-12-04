module Api::V1
  class TasksController < ApplicationController
    before_action :find_task, only: %i[destroy show update]

    def index
      @tasks = Task.where(task_params).order(:id)
      paginate json: @tasks
    end

    def create
      @task = Task.new(task_params)
      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
    
    def show
      render json: @task
    end

    def update
      if params[:user_id].to_i == @task.user_id
        if @task.update_attributes(task_params)
          render json: @task, status: :ok
        else
          render json: {errors: @task.errors}, status: :unprocessable_entity
        end
      else
        render json: {error: 'Incorrect user_id'}, status: :unauthorized
      end  
    end 

    def destroy
      if params[:user_id].to_i == @task.user_id
        @task.destroy
        render json: @task, status: :ok
      else
        render json: {error: 'Incorrect user_id'}, status: :unauthorized
      end  
    end


  private  
    def find_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.permit(:title, :body, :deadline, :completed, :started, :project_id, :user_id, :doer_id)
    end
  end
end
