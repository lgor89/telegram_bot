require 'net/http'
require 'json'

BOT_TOKEN = Rails.application.secrets.telegram_token
URL_REQUEST = Rails.application.secrets.url_request
URL = Rails.application.secrets.url
def set_webhook
  uri = URI(URL_REQUEST + 'setWebhook' + '?url=' + URL.to_s)
  @res = Net::HTTP.get(uri)
  p @result = JSON.parse(@res)
end
set_webhook
