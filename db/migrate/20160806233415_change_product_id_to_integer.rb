class ChangeProductIdToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :id, :integer
  end
end
