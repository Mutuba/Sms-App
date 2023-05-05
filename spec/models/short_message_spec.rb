# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortMessage, type: :model do
  describe 'message creation' do
    let!(:short_message) { create(:short_message) }
    context 'when details are correct' do
      it 'it creates a message' do
        expect(short_message).to be_valid
        expect(short_message.message).to eq 'Congratulations, your transaction is successful.'
      end
    end

    context 'when time is in the past' do
      it 'it does not create a message' do
        bad_short_message = ShortMessage.create(sent_at: Time.now - 3.minutes)
        expect(bad_short_message).to be_invalid
        expect(bad_short_message.errors.full_messages[0]).to eq "Sent at can't be in the past"
      end
    end
  end
end
