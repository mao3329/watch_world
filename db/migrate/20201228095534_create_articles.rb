class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null:false
      t.text :text, null: false
      t.integer :category_id
      t.references :user, foreign_keys: true
      t.timestamps
    end
  end
end
