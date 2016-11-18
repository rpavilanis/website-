class RemoveImagefromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :image, :attachments
  end
end
