class AddDesktopVisittoStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :desktop_visit, :integer
  end
end
