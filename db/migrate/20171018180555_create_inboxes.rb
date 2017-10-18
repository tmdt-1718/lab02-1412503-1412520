class CreateInboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :inboxes do |t|
      t.bigint :message_id
      t.boolean :isRead
      t.bigint :recipient_id

      t.timestamps
    end
  end
end
