class Friend < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "user_id", required: false
	belongs_to :friend, class_name: "User", foreign_key: "friend_id", required: false
end
