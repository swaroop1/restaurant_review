class User < ActiveRecord::Base
  attr_accessible :displayName, :identifier, :mobileNumber, :prefferedUserName, :providerName, :status, :verifiedEmail
  
  #validations
  validates :identifier, :providerName, :verifiedEmail , presence: true
end
