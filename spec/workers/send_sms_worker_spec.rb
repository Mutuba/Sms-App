require 'rails_helper' 
require 'sidekiq/testing'
Sidekiq::Testing.fake!
RSpec.describe SendSmsWorker, type: :worker do
  let!(:short_message) { create(:short_message) }
  describe 'testing worker' do
    it 'SendSmsWorker jobs are enqueued in the scheduled queue' do
      described_class.perform_at(short_message.sent_at, short_message.id)
      expect(described_class.queue).to eq "default"
      expect(described_class.jobs.size).to eq 1
    end
  end
end