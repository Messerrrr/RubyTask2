class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
 def self.ransackable_attributes(auth_object = nil)
    column_names - ['encrypted_password', 'password_reset_token', 'owner'] # исключение чувствительных атрибутов
  end

end
