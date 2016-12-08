class AddNoteToEx < ActiveRecord::Migration[5.0]
  def change
    add_column :exes, :note, :integer
  end
end
