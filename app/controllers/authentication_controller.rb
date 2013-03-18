require 'httparty'
class AuthenticationController < ApplicationController
  include HTTParty

  base_uri "rpxnow.com/api/v2/auth_info"
  def initiate_response
  	 id_token = params[:token]
     response = self.class.get("", query: {apiKey: '4575dd65da70ff3ba06d4fe231c30bb8343076b2', token: id_token})
     user_info = response.parsed_response # getting hold of the user details as hash
     identity_provider = user_info.fetch("profile").fetch("providerName")
     identifier_value = case identity_provider
     	when "Facebook" then user_info.fetch("profile").fetch("identifier").split("=")[1]
     	when "Google" then user_info.fetch("profile").fetch("googleUserId")
     end
     user_loggedin = User.where(providerName: identity_provider,identifier: identifier_value).first_or_create(
      providerName: identity_provider, identifier: identifier_value, verifiedEmail: user_info.fetch("profile").fetch("verifiedEmail"),
      prefferedUserName: user_info.fetch("profile").fetch("preferredUsername"), displayName: user_info.fetch("profile").fetch("displayName"),
      status: true, mobileNumber: nil)
     user_loggedin.add_role :author
     session[:current_user_id] = user_loggedin.id # saving id in session  
     respond_to do |format|
         format.html {redirect_to restaurants_path}
     end 
  end

  def logout
     session[:current_user_id] = nil
     redirect_to restaurants_path
  end	
end	

# Client.where(:first_name => 'Andy').first_or_create(:locked => false)
# => ["id", "providerName", "identifier", "verifiedEmail", "prefferedUserName", "d
# isplayName", "status", "mobileNumber", "created_at", "updated_at"]