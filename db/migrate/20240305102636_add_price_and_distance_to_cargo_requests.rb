class AddPriceAndDistanceToCargoRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :cargo_requests, :price, :float
    add_column :cargo_requests, :distance, :float
  end
end
