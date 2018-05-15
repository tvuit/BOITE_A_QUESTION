class AddFbCounttoStories < ActiveRecord::Migration[5.1]
  def change
  add_column :stories, :fb_count, :integer
  end
end
