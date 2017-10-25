class Inbox < ApplicationRecord
	attr_accessor :isOfFriend
	belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
	belongs_to :message
end
