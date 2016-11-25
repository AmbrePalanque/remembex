class CreateExes < ActiveRecord::Migration[5.0]
  def change
    create_table :exes do |t|
      t.string :name
      t.integer :note_sex
      t.integer :note_gentilesse
      t.integer :note_humour
      t.integer :numero
      t.text :point_positif
      t.text :point_negatif
      t.text :description

      t.timestamps
    end
  end
end
