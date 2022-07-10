class Product < ApplicationRecord
  #RELACION ENTRE EL PRODUCTO Y EL STOCK
  belongs_to :stock, optional: true, foreign_key: :stock_id, inverse_of: :products
  #Relacion entre productos y categorias
  belongs_to :category, foreign_key: "category_id", class_name: "Category"
  #Relacion entre el proveedor y el producto.
  belongs_to :payment, class_name: 'Provider', foreign_key: 'provider_id', optional: true
  #Relacion entre los impuestos y el producto.
  belongs_to :tax, class_name: 'Tax', foreign_key: 'tax_id'
  belongs_to :brand, foreign_key: "brand_id", class_name: "Brand"
  belongs_to :date_expiration, optional: true, foreign_key: :date_expirations_id, inverse_of: :products
  has_many :codes
  has_many :decreases
  has_many :voucher_details , dependent: :destroy#, inverse_of: :product
  has_many :stocks
  has_many :date_expirations , inverse_of: :products, foreign_key: :date_expirations_id
  validates_presence_of :category_id, :stock, :brand_id, :date_expiration
  accepts_nested_attributes_for :voucher_details, allow_destroy: true
  accepts_nested_attributes_for :decreases
  accepts_nested_attributes_for :stocks
  accepts_nested_attributes_for :date_expirations
  accepts_nested_attributes_for :codes


end
