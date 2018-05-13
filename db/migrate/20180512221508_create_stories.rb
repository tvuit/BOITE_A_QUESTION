class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :firstPublicationDate
      t.string :media
      t.string :sharedUrl

      t.timestamps
    end
  end
end
