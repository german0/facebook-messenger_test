class MessengerController < ApplicationController
  skip_before_action :verify_authenticity_token

  HUB_VERIFY_TOKEN = "hub.verify_token".freeze
  HUB_CHALLENGE = "hub.challenge".freeze

  def create
    MessengerService.new(params).call
    head :ok
  end

  def index
    return head :bad_request if params[HUB_VERIFY_TOKEN] != FACEBOOK_WEBHOOK_VERIFY_KEY

    render plain: params[HUB_CHALLENGE]
  end

  private

  def index_permit_params
    params.require([HUB_VERIFY_TOKEN, HUB_CHALLENGE]).permit(HUB_VERIFY_TOKEN, HUB_CHALLENGE)
  end
end
