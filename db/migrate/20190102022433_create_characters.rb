class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.string :race
      t.string :char_class
      t.string :alignment

      t.timestamps
    end
  end
end
