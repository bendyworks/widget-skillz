class Api::WidgetTemplatesController < ApplicationController
  before_action :set_widget_template, only: [:show, :edit, :update, :destroy]

  def index
    @widget_templates = WidgetTemplate.all
    render json: @widget_templates
  end

  def show
    render json: @widget_template, root: true
  end

  def create
    @widget_template = WidgetTemplate.new(widget_template_params)

    if @widget_template.save
      render json: @widget_template, root: true
    else
      render json: @widget_template.errors, status: :unprocessable_entity
    end
  end

  def update
    if @widget_template.update(widget_template_params)
      render json: @widget_template, root: true
    else
      render json: @widget_template.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @widget_template.destroy
    head :no_content
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_widget_template
    @widget_template = WidgetTemplate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def widget_template_params
    params.require(:widget_template).permit(:title, fields: params[:widget_template][:fields].try(:keys))
  end
end
