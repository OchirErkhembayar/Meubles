class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :offers, dependent: :destroy
  has_many :furnitures, through: :offers
<<<<<<< HEAD
  has_many :orders
=======
  has_many :reviews, dependent: :destroy
>>>>>>> 26e595c4d86009f0ae06dca1cdfca6d2921c1785
end
