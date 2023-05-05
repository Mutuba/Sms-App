# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortMessage, type: :model do
  # ensure columns message and created_by are present before saving
  it { should validate_presence_of(:message) }
end
