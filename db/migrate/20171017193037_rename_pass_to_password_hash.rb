class RenamePassToPasswordHash < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :pass, :password_hash 
  end
end
