class AddUserToCargoRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :cargo_requests, :user, null: false, foreign_key: true
  end
end
