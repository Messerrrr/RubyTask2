ActiveAdmin.register CargoRequest do
permit_params :id, :firstname, :lastname, :middlename, :phone, :email, :weight, :length, :width, :height, :origin, :destination, :distance, :price, :user_id

  index do
    selectable_column
    id_column
    column :firstname
    column :lastname
    column :middlename
    column :phone
    column :email
    column :status
    column :weight
    column :length
    column :width
    column :height
    column :origin
    column :destination
    column :distance
    column :price
    column :user_id
    actions
  end

  filter :title
  form do |f|
    f.inputs "Post Details" do
      f.input :firstname
      f.input :lastname
      f.input :middlename
      f.input :phone
      f.input :email
      f.input :weight
      f.input :length
      f.input :width
      f.input :height
      f.input :origin
      f.input :destination
      f.input :distance
      f.input :price
    end
    f.actions
  end
end
