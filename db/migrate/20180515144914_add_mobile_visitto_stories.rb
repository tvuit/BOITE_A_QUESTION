class AddMobileVisittoStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :mobile_visit, :integer
  end
end
