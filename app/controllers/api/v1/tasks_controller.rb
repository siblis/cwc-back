module Api::V1
  class TasksController < ApplicationController
    before_action :find_task, only: %i[destroy show update]

    def index
      @tasks = Task.where(task_params).order(:npos)
      paginate json: @tasks
    end

    def create
      @task = Task.new(task_params)
      @task.npos = get_npos
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

    def setnpos
      Task.transaction do
        Task.find_each do |task|
          task.npos = task.id
          task.save
        end
      end
      @tasks = Task.where(task_params).order(:npos)
      paginate json: @tasks
    end

    def change_npos
      nb = params[:nposb].to_i
      ne = params[:npose].to_i
      if nb == ne
        render json: {error: 'Incorrect params'}, status: :unprocessable_entity
      else
        task = Task.where('npos = ' + nb.to_s).first
        Task.transaction do
          if nb < ne
            Task.where(npos: nb..ne).update_all("npos = npos - 1")
          else
            Task.where(npos: ne..nb).update_all("npos = npos + 1")
          end  
          task.update_attributes(npos: ne)
        end
        render status: :ok
      end
    end

  private  
    def find_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.permit(:title, :body, :deadline, :completed, :started, :project_id, :user_id, :doer_id, :nposb, :npose)
    end

    def get_npos
      npos = Task.maximum('npos')
      npos = 0 unless npos
      npos += 1  
    end
  end
end
