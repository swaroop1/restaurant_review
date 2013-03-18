class User < ActiveRecord::Base
  rolify
  attr_accessible :displayName, :identifier, :mobileNumber, :prefferedUserName, :providerName, :status, :verifiedEmail

  has_many :restaurants, inverse_of: :user, dependent: :destroy, autosave: true

  #validations
  validates :identifier, :providerName, :verifiedEmail , presence: true
end
