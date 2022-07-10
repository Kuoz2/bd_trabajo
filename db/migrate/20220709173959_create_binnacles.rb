class CreateBinnacles < ActiveRecord::Migration[6.0]
  def change
    create_table :binnacles do |t|
      t.string :asunto
      t.string :q_se_iso
      t.string :hora
      t.string :dia

      t.timestamps
    end
  end
end
