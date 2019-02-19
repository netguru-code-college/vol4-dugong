class RenameValueFromVotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :votes, :value, :updown
  end
end
