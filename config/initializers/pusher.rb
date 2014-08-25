require 'pusher'

config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
Pusher.url = "http://#{config_pusher['access_key']}:#{config_pusher['access_key_secret']}@api.pusherapp.com/apps/{config_pusher['app_id']}"
Pusher.logger = Rails.logger
