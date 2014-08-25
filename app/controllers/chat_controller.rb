class ChatController < ApplicationController
  def index
    config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
    @pusher_access_key = config_pusher['access_key']
  end
  def post
    Pusher['general_channel'].trigger('chat_event', {
      message: params[:message]
    })
    render :text => 'OK', :status => 200
  end
end
