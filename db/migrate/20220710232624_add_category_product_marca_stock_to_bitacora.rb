class AddCategoryProductMarcaStockToBitacora < ActiveRecord::Migration[6.0]
  def change
    add_column :binnacles, :producto ,:bigint, :default => 0
    add_column :binnacles, :categoria, :bigint, :default => 0
    add_column :binnacles, :stock, :bigint, :default => 0
    add_column :binnacles, :marca, :bigint, :default => 0

  end
end
