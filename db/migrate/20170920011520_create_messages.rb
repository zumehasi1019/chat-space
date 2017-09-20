class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.integer :user_id, null: false, foreign_key: true
      t.integer :group_id, null: false, foreign_key: true
      t.text :detail, null: false, foreign_key: true
      t.string :image, foreign_key: true

      t.timestamps null: false
    end
  end
end
