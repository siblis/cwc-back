module Api::V1
  class CommandItemsController < ApplicationController
    before_action :set_command_item, only: %i[update, destroy, show]

    # GET /command_items
    def index
      @command_items = CommandItem.where(command_item_params).order(:id)
      render json: @command_items
    end

    # GET /command_items/1
    def show
      render json: @command_item
    end

    # POST /command_items
    def create
      @command_item = CommandItem.where(command_item_params).first
      if @command_item
        render json: @command_item, status: :created
      else
        @command_item ||= CommandItem.new(command_item_params) 

        if @command_item.save
          render json: @command_item, status: :created
        else
          render json: @command_item.errors, status: :unprocessable_entity
        end
      end
    end

    # PATCH/PUT /command_items/1
    def update
      if @command_item.update(command_item_params)
        render json: @command_item
      else
        render json: @command_item.errors, status: :unprocessable_entity
      end
    end

    # DELETE /command_items/1
    def destroy
      @command_item.destroy
      render json: @command_item, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_command_item
        @command_item = CommandItem.find(params[:id])
        puts '!!!!!!!!!!!!!!!!!!!'
      end

      # Only allow a trusted parameter "white list" through.
      def command_item_params
        params.permit(:project_id, :user_id)
      end
  end
end