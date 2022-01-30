class CreateJoinTableBannerCampaign < ActiveRecord::Migration[6.1]
  def change
    create_join_table :banners, :campaigns do |t|
      # t.index [:banner_id, :campaign_id]
      # t.index [:campaign_id, :banner_id]
    end
  end
end
