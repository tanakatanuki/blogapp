class RenameFromblogIdTObblogIdOnBBlogs < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :blog_id, :bblog_id
  end
end
