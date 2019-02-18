class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.references :users, foreign_key: true
      t.references :followable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
