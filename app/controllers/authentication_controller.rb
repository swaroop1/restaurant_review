require 'httparty'
class AuthenticationController < ApplicationController
  include HTTParty

  base_uri "rpxnow.com/api/v2/auth_info"
  def initiate_response
  	 id_token = params[:token]
     response = self.class.get("", query: {apiKey: '4575dd65da70ff3ba06d4fe231c30bb8343076b2', token: id_token})
     render text: response.parsed_response 
  end	
end	