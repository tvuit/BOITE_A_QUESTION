class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.text :answer
      t.timestamp :post_date

      t.timestamps
    end
  end
end
