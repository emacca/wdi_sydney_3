class CreateSenses < ActiveRecord::Migration
  def change
    create_table :senses do |t|
      t.string :name
      t.text :description
      t.string :image
      t.references :robot, index: true
      
      t.timestamps
    end
  end
end
