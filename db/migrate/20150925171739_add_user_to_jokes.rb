class AddUserToJokes < ActiveRecord::Migration
  def change
    add_reference :jokes, :user, index: true
    add_foreign_key :jokes, :users
  end
end
