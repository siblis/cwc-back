module Api::V1
  class ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :update, :destory]

    def index
      @projects = Project.all
      paginate json: @projects
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        render status: :created
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end
    
    def show
      @project = Project.find(params[:id])
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
      render status: 204
    end

  private  
    def project_params
      params.require(:project).permit(:title, :body, :deadline, :completed, :started)
    end

    def find_project
      @project = Project.find(params[:id])
    end
  end
end
