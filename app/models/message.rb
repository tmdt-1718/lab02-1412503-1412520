class Message < ApplicationRecord
	belongs_to :sender, class_name: "User", foreign_key: "sender_id"
	has_many :inboxes, foreign_key: "mesage_id", class_name: "Inbox"
end
