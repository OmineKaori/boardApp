class AddImageNameToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image_name, :string
  end
end
