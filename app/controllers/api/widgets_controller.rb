class Api::WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  def index
    @widgets = Widget.all
    render json: @widgets
  end

  def show
    render json: @widget, root: true
  end

  def create
    @widget = Widget.new(widget_params)

    if @widget.save
      render json: @widget, root: true
    else
      render json: @widget.errors, status: :unprocessable_entity
    end
  end

  def update
    if @widget.update(widget_params)
      render json: @widget, root: true
    else
      render json: @widget.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @widget.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_widget
    @widget = Widget.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def widget_params
    params.require(:widget).permit(:name, :body, :location_x, :location_y, :width,
                                     :height, :custom_fields, :custom_field_types,
                                     template_fields: params[:widget][:template_fields].try(:keys))

  end
end
