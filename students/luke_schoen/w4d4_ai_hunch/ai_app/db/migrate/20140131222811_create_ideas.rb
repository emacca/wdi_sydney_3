class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.references :robots, index: true
      t.references :senses, index: true
      
      t.timestamps
    end
  end
end
