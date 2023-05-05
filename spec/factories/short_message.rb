# frozen_string_literal: true

# spec/factories/batch.rb
FactoryBot.define do
  factory :short_message do
    sent_at { Time.now + 6.hours }
  end
end
