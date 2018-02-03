class AddImageToBblogs < ActiveRecord::Migration[5.1]
  def change
    add_column :bblogs, :image, :text
  end
end
