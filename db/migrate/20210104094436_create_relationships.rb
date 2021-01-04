class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user,   foreign_key: true
      t.references :follow, foreign_kye: { to_table: :uers }

      t.timestamps

      t.index [:user_id, :follow_id], unique: true
    end
  end
end
