class AddUserIdToBblogs < ActiveRecord::Migration[5.1]
  def change
    add_column :bblogs, :user_id, :integer
  end
end
