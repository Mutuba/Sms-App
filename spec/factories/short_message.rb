# frozen_string_literal: true

# spec/factories/batch.rb
FactoryBot.define do
  factory :short_message do
    message { 'Congratulations, your transaction is successful.' }
    sent_at { Time.now + 6.hours }
  end
end
