class AddDataToProduct < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :detail, :string
  	add_column :products, :image, :string
  end
end
