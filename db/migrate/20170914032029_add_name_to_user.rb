class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false, index:true, unique: true
  end
end
