class CargoRequest < ApplicationRecord
  validates :firstname, :lastname, :middlename, :phone, :email, :weight, :length, :width, :height, :origin, :destination, :distance, :price, presence:true
  belongs_to :user
def self.ransackable_attributes(auth_object = nil)
   ["firstname", "lastname", "middlename", "phone", "email", "weight", "length", "width", "height", "origin", "destination", "distance", "price"]
end
#include AASM
#  aasm do
#    state :accepted, initial: true
#    state :on_the_way
#    state :completed

#    event :send_cargo do
#      transitions from: :accepted, to: :on_the_way
#    end

#    event :end_request do
#      transitions from: :on_the_way, to: :completed
#    end

#  end

  #def initialize(firstname, lastname, middlename, phone, email,weight, length, width, height, origin, destination, distance, price, status="Принято")
   # @firstname = firstname
    #@lastname = lastname
 #   @middlename = middlename
 #   @phone = phone
  #  @email = email
 #   @weight = weight
 #   @length = length
 #   @width = width
 #   @height = height
 #   @origin = origin
 #   @destination = destination
 #   @price = price
 #   @distance = distance
 #   @status=status
 # end

end
