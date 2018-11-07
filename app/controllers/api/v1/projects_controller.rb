module Api::V1
  class ProjectsController < ApplicationController
    
    def index
      @projects = Project.all
      render json: @projects
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
      if @project
        render json: @project
      else
        render json: {project: "not found"}, status: :not_found
      end
    end

    def update
      @project = Project.find(params[:id])
      if @project
        if @project.update_attributes(project_params)
          render json: @project, status: :ok
        else
          render json: {errors: @project.errors}, status: :unprocessable_entity
        end
      else
        render json: {project: "not found"}, status: :not_found
      end
    end 

    def destroy
      @project = Project.find(params[:id])
      if @project
        @project.destroy
        render status: 204
      else
        render json: {project: "not found"}, status: :not_found
      end
    end

  private  
    def project_params
      params.require(:project).permit(:title, :body, :deadline, :completed, :started)
      t.string :title, comment: 'Заголовок'
      t.text :body, comment: 'Описание'
      t.datetime :deadline, comment: 'Планируемое окончание'
      t.boolean :completed, comment: 'Выполнено'
      t.datetime :started, comment: 'Начато'
    end
  end
end
