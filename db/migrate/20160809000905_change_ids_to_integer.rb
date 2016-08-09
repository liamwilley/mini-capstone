class ChangeIdsToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :categorized_products, :product_id, "integer USING CAST(product_id AS integer)"
    change_column :categorized_products, :category_id, "integer USING CAST(category_id AS integer)"
  end
end
