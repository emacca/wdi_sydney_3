class CreateHunches < ActiveRecord::Migration
  def change
    create_table :hunches do |t|
      t.string :name
      t.text :description
      t.references :ideas, index: true
      
      t.timestamps
    end
  end
end
