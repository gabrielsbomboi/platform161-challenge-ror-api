class Api::V1::CampaignsController < ApplicationController
  before_action :retrieve, only: [:update, :destroy, :show]

  def index
    @campaigns = Campaign.select("id, name")

    render json: @campaigns, status: 200
  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      render json: @campaign, status: 200
    else
      render json: { errors: @campaign.errors }, status: 422
    end
  end

  def show
    render json: @campaign, include: [banners: {only: [:id, :name]}, time_slots: {only: [:id, :start_at]}], status: 200
  end

  def update
    if @campaign.update(campaign_params)
      render json: @campaign, status: 200
    else
      render json: { errors: @campaign.errors }, status: 422
    end
  end

  def destroy
    if @campaign.destroy
      render json: { message: 'ok'}, status: 200
    else
      render json: { errors: @campaign.errors }, status: 422
    end
  end

  private

    def retrieve
      @campaign = Campaign.find(params[:id])
    rescue
      render json: { error: 'not-found'}, status: 404
    end

    def campaign_params
      params.require(:campaign).permit(:name, time_slots_attributes: [:id, :start_at, :_destroy], banner_ids: [])
    end
end
