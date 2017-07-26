require 'net/http'
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  COMMON_REQUEST = Rails.application.secret.common_request
  def callback
    @response = params[:message][:text]
    @chat_id = params[:message][:chat][:id]
    @name = params[:message][:from][:first_name].to_s
    if @response.include?('start')
      uri = URI(COMMON_REQUEST + 'sendMessage')
      res = Net::HTTP.post_form(uri,"chat_id"=>@chat_id.to_s,"text"=>"hello #{@name}")
    end
  end
end
