class TonesController < ApplicationController

  # before_action :authenticate_user!
  before_action :brand, only: [:index, :create]

  def index
    @tones = @brand.tones.order(created_at: :desc)
  end

  def create
    @tone = @brand.tones.new(tone_params)
    if @tone.save
      render json: @tone, status: :created
    else
      render json: { errors: @tone.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @tone
  end

  def update
    if @tone.update(tone_params)
      render json: @tone
    else
      render json: { errors: @tone.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @tone.destroy
    head :no_content
  end

  private

  def brand
    @brand ||= Brand.find(params[:brand_id])
  end

  def set_tone
    @tone = Tone.find(params[:id])
  end

  def tone_params
    params.require(:tone).permit(:name, :description)
  end
end
