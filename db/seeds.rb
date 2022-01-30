4.times do
  campaign = Campaign.create({name: Faker::Company.name})
  2.times do
    campaign.banners.create({name: Faker::Dessert.variety, content: Faker::Lorem.paragraph})
  end
end
