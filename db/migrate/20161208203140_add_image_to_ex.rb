class AddImageToEx < ActiveRecord::Migration[5.0]
  def change
    add_attachment :exes, :image
  end
end
