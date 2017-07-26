require 'net/http'
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  URL_REQUEST = Rails.application.secret.url_request
  def callback
    @response = params[:message][:text]
    @chat_id = params[:message][:chat][:id]
    @name = params[:message][:from][:first_name].to_s
    if @response.include?('start')
      uri = URI(URL_REQUEST + 'sendMessage')
      res = Net::HTTP.post_form(uri,"chat_id"=>@chat_id.to_s,"text"=>"hello #{@name}")
    end
  end
end
