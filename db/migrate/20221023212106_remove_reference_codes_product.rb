class RemoveReferenceCodesProduct < ActiveRecord::Migration[6.0]
  def change
    remove_reference :codes, :product,  foreing_key:true, index: true
  end
end
