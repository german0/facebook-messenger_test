class MessengerClient
  def send_message(message)
    response = faraday_connection.post("me/messages?access_token=#{page_access_token}", message)
    response.body if response&.success?
  rescue StandardError
    nil
  end

  def user_info(sender_id)
    response = faraday_connection.get("#{sender_id}?access_token=#{page_access_token}")
    response.body if response&.success?
  rescue StandardError
    nil
  end

  private

  def faraday_connection
    connection = Faraday.new(url: graph_url) do |faraday|
      faraday.response :json
      faraday.request :json
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
    connection
  end

  def page_access_token
    FACEBOOK_PAGE_ACCESS_TOKEN
  end

  def graph_url
    FACEBOOK_GRAPH_BASE_URL
  end
end
