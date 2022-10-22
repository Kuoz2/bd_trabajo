class AddPcidogiInCodes < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :pcodigo, :bigint
  end
end
