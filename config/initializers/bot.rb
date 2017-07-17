require 'net/http'
require 'json'

BOT_TOKEN = Rails.application.secrets.telegram_token
COMMON_REQUEST = Rails.application.secrets.telegram_token
URL = Rails.application.secrets.url
def set_webhook
  uri = URI(COMMON_REQUEST + 'setWebhook' + '?url=' + URL.to_s)
  @res = Net::HTTP.get(uri)
  p @result = JSON.parse(@res)
end
set_webhook
