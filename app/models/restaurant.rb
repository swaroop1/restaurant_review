class Restaurant < ActiveRecord::Base
  attr_accessible :ambience, :food_quality, :name, :service

  #validations
  validates :name, presence: true

  validates :name, format: { with: /[a-zA-Z]*/, message: "Only letters allowed"}
end
