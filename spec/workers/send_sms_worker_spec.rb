# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!
RSpec.describe SendSmsWorker, type: :worker do
  let!(:short_message) { create(:short_message) }
  describe 'testing worker' do
    it 'SendSmsWorker jobs are enqueued in the scheduled queue' do
      described_class.perform_at(short_message.sent_at, short_message.id)
      expect(described_class.queue).to eq 'default'
      expect(described_class.jobs.size).to eq 1
    end

    context 'when Sidekiq::Testing.disabled?' do
      before do
        Sidekiq::Testing.disable!
        Sidekiq.redis(&:flushdb)
      end

      after do
        Sidekiq.redis(&:flushdb)
      end

      it 'prevents duplicate jobs from being scheduled' do
        SidekiqUniqueJobs.use_config(enabled: true) do
          expect(described_class.perform_in(3600, 1)).not_to eq(nil)
          expect(described_class.perform_async(1)).to eq(nil)
        end
      end
    end
  end
end
