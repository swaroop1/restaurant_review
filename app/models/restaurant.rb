class Restaurant < ActiveRecord::Base
  attr_accessible :ambience, :food_quality, :name, :service

  belongs_to :user, inverse_of: :restaurants, autosave: true
  #validations
  validates :name, presence: true

  validates :name, format: { with: /[a-zA-Z]*/, message: "Only letters allowed"}

  resourcify
end
