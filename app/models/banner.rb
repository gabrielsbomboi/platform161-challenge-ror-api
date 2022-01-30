class Banner < ApplicationRecord
  has_and_belongs_to_many :campaigns

  validates :name, :content, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
