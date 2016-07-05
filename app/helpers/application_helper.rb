module ApplicationHelper
  def send_sms message
    Nexmo::Client.new.send_message(
      from: ENV['NEXMO_NUMBER'],
      to: message.number,
      text: message.text
    )
  end

  def send_cable message
    html = render_message(message)

    ActionCable.server.broadcast 'messages',
      number: message.number,
      html: html
  end

  def render_message message
    ApplicationController.render({
      partial: 'messages/message',
      locals: { message: message }
    })
  end
end
