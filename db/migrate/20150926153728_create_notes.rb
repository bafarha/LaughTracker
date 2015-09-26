class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true
      t.text :body
      t.integer :rating
      t.references :joke, index: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :users
    add_foreign_key :notes, :jokes
  end
end
