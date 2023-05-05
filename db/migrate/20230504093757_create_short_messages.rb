# frozen_string_literal: true

class CreateShortMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :short_messages do |t|
      t.string :message, default: 'Congratulations, your transaction is successful.'
      t.datetime :sent_at
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
