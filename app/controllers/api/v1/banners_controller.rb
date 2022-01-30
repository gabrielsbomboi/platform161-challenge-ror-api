class Api::V1::BannersController < ApplicationController
  before_action :retrieve, only: [:update, :destroy, :show]

  def index
    @banners = Banner.select("id, name")

    render json: @banners, status: 200
  end

  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      render json: @banner, status: 200
    else
      render json: { errors: @banner.errors }, status: 422
    end
  end

  def show
    render json: @banner, status: 200
  end

  def update
    if @banner.update(banner_params)
      render json: @banner, status: 200
    else
      render json: { errors: @banner.errors }, status: 422
    end
  end

  def destroy
    if @banner.destroy
      render json: { message: 'ok'}, status: 200
    else
      render json: { errors: @banner.errors }, status: 422
    end
  end

  private

    def retrieve
      @banner = Banner.find(params[:id])
    rescue
      render json: { error: 'not-found'}, status: 404
    end

    def banner_params
      params.require(:banner).permit(:name, :content)
    end
end
