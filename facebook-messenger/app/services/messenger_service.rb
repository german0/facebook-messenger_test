class MessengerService
  def initialize(params)
    @bot_message = params[:entry].first
  end

  def call
    send_message(welcome_message)
  end

  private

  def send_message(message)
    MessengerClient.new.send_message(message)
  end

  # rubocop:disable Metrics/MethodLength
  def message(text)
    {
      recipient: {
        id: sender_id
      },
        message: {
          attachment: {
            type: "template",
              payload: {
                template_type: "button",
                  text: text,
                  buttons: [{
                    type: "web_url",
                          url: "",
                          title: "Ariana",
                          messenger_extensions: true,
                          webview_height_ratio: "full"
                  }]
              }
          }
        }
    }
  end

  def welcome_message
    user = MessengerClient.new.user_info(sender_id)
    {
      recipient: {
        id: sender_id
      },
        message: {
          text: "hello #{user['first_name']}, my name is Ariana!"
        }
    }
  rescue StandardError
    nil
  end
  # rubocop:enable Metrics/MethodLength

  def email_confirm_message
    {
      recipient: { id: sender_id },
        message: { text: "Confirm Email", quick_replies: [{ content_type: "user_email" }] }
    }
  end

  def sender_id
    @bot_message.dig(:messaging, 0, :sender, :id)
  end

  def postback_payload
    @bot_message.dig(:messaging, 0, :postback, :payload)
  end

  def email_message?
    @bot_message.dig(:messaging, 0, :message, :nlp, :entities, :email).present?
  end
end
