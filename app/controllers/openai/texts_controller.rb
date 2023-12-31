class Openai::TextsController < ApplicationController
  # before_action :authenticate_user!
  before_action :brand, only: %i[index create]
  before_action :text, only: %i[show destroy]

  def index
    @texts = brand.texts.order(created_at: :desc)
  end

  def create
    new_text = brand.texts.new
    new_text.content = Openaitexter.call(text.content.to_plain_text)
    return unless new_text.save
      redirect_to brand, notice: 'AI has responded'
  end

  def show
    render json: text
  end

  def destroy
    text.destroy
    head :no_content
  end

  def score
  end

  def improve
  end

  def finish
  end

  def reduce
  end

  def increase
  end

  def change
  end

  private

  def brand
    @brand ||= brand.find(params[:brand_id])
  end

  def text
    brand.texts.find(params[:text_id])
  end
end
