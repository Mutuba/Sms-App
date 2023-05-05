# frozen_string_literal: true

# ShortMessagesController
class ShortMessagesController < ApplicationController
  before_action :set_short_message, only: %i[show update destroy]

  # GET /short_messages
  def index
    @short_messages = ShortMessage.all
    json_response(@short_messages)
  end

  # POST /short_messages
  def create
    @short_message = ShortMessage.create!(short_message_params)
    sent_out_in = (@short_message.sent_at - Time.now).abs
    p SendSmsWorker.perform_in(sent_out_in, @short_message.id)
    json_response(@short_message, :created)
  end

  # GET /short_messages/:id
  def show
    json_response(@short_message)
  end

  # PUT /short_messages/:id
  def update
    @short_message.update(short_message_params)
    head :no_content
  end

  # DELETE /short_messages/:id
  def destroy
    @short_message.destroy
    head :no_content
  end

  private

  def short_message_params
    # whitelist params
    params.permit(:message, :sent_at)
  end

  def set_short_message
    @short_message = ShortMessage.find(params[:id])
  end
end
