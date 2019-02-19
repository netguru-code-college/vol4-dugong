class ChangeReferenceToUserInFollowers < ActiveRecord::Migration[5.2]
  change_table :followers do |t|
    t.rename :users_id, :user_id
    end
end
