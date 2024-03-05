class CreateCargoRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :cargo_requests do |t|
      t.string :firstname
      t.string :lastname
      t.string :middlename
      t.string :phone
      t.string :email
      t.float :weight
      t.float :length
      t.float :width
      t.float :height
      t.string :origin
      t.string :destination
      t.string :status

      t.timestamps
    end
  end
end
