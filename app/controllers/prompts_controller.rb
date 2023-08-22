class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show, :update, :destroy]
  before_action :brand, only: [:create]

  def create
    @prompt = @brand.prompt.new(prompt_params)
    if @prompt.save
      render json: @prompt, status: :created
    else
      render json: { errors: @prompt.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @prompt
  end

  def update
    if @prompt.update(prompt_params)
      render json: @prompt
    else
      render json: { errors: @prompt.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @prompt.destroy
    head :no_content
  end

  def index
    @prompts = Prompt.all
    render json: @prompts
  end

  private

  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  def prompt_params
    params.require(:prompt).permit(:content)
  end

  def brand
    @brand ||= Brand.find(params[:brand_id])
  end
end
