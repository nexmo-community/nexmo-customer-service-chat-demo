class TextMessagesController < ApplicationController
  include ApplicationHelper

  def index
    message = Message.create!(
      number: params[:msisdn],
      text: params[:text],
      inbound: true
    )
    send_cable(message)
    render json: { state: 200 }
  end
end
