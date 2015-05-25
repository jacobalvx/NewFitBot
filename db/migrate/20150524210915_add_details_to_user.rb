class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :weight, :integer
    add_column :users, :fat, :integer
    add_column :users, :muscle, :integer
    add_column :users, :sport, :string
  end
end
