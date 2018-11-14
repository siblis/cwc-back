module Api::V1
  class ProjectsController < ApplicationController
    before_action :find_project, only: %i[destroy show update]

    def index
      @projects = Project.order(:id)
      paginate json: @projects
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        render json: @project, status: :created
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end
    
    def show
      render json: @project
    end

    def update
      if @project.update_attributes(project_params)
        render json: @project, status: :ok
      else
        render json: {errors: @project.errors}, status: :unprocessable_entity
      end
    end 

    def destroy
      @project.destroy
      render json: @project, status: :ok
    end

  private  
    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.permit(:title, :body, :deadline, :completed, :started)
    end

  end
end
