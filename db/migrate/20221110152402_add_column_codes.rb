class AddColumnCodes < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :total_doble, :bigint, :default => 0
    #Ex:- :default =>''
  end
end
