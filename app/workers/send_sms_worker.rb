# frozen_string_literal: true

require 'sidekiq-scheduler'

# SendSmsWorker
class SendSmsWorker
  include Sidekiq::Worker

  sidekiq_options lock: :until_executed,
                  on_conflict: :reject

  def perform(short_message_id)
    short_message = ShortMessage.find(short_message_id)
    puts short_message.message.to_s
    short_message.update(sent: true)
  rescue StandardError => e
    puts e.message.to_s
  end
end
