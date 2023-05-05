# frozen_string_literal: true

class ShortMessage < ApplicationRecord
  # validates :message, presence: true
  validate :send_at_date_cannot_be_in_the_past

  def send_at_date_cannot_be_in_the_past
    begin
      Time.parse(sent_at.to_s)
    rescue ArgumentError
      errors.add(:sent_at, 'invalid time format entered')
    end
    errors.add(:sent_at, "can't be in the past") if sent_at.present? && sent_at < Time.now
  end
end
