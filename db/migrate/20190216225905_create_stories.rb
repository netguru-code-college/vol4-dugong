class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :text
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
