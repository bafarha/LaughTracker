class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
    	t.belongs_to :joke, index: true
    	t.belongs_to :tag, index: true
      t.timestamps null: false
    end
  end
end
