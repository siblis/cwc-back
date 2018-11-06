module Api::V1
  class ProjectsController < ApplicationController
    
    def index
      @projects = Project.all
      render json: @projects
    end

    def create
    end
    
    def show
      @project = Project.find(params[:id])
      if @project
        render json: @project
      else
        render json: {project: "not found"}, status: :not_found
      end
    end

    def update
    end 

    def destroy
      @project = Project.find(params[:id])
      if @project
        @project.destroy
      else
        render json: {project: "not found"}, status: :not_found
      end
    end

  end
end
