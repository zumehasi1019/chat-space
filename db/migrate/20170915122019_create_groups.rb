class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false, index: true, unique: true

      t.timestamps null: false
    end
  end
end
