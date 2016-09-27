class TextMessagesController < ApplicationController
  include ApplicationHelper
  
  skip_before_action :verify_authenticity_token, :only => [:create]

  # If webhooks are set up as GET requests
  def index
    create_message(params)
  end
 
  # If webhooks are set up as POST requests
  def create
    create_message(params)
  end

  def create_message(params)
    message = Message.create!(
      number: params[:msisdn],
      text: params[:text],
      inbound: true
    )
    send_cable(message)
    render json: { state: 200 }
  end
end
