class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :update, :destroy]
  # before_action :authenticate_brand!

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      render json: @brand, status: :created
    else
      render json: { errors: @brand.errors }, status: :unprocessable_entity
    end
  end

  def show
    # authorize @brand
    render json: @brand
  end

  def update
    # authorize @brand

    if @brand.update(brand_params)
      render json: @brand
    else
      render json: { errors: @brand.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    # authorize @brand
    @brand.destroy
    head :no_content
  end

  def index
    @brands = Brand.all
    render json: @brands
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end
end
