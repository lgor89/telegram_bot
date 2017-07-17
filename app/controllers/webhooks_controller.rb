require 'net/http'
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  COMMON_REQUEST = Rails.application.secret.common_request
  def callback
    @response = params[:message][:text]
    @chat_id = params[:message][:chat][:id]
    @name = params[:message][:from][:first_name]).to_s)
    if @response.casecmp('start').zero?
      parameters = URI.encode_www_form("chat_id"=>@chat_id.to_s,"text"=>"hello #{@name}")
      uri = URI(COMMON_REQUEST + 'sendMessage?'+"#{parameters}")
      @res = Net::HTTP.post_form(uri, 'q' => '')
    end
  end
end
