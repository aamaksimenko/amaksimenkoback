class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,         
         jwt_revocation_strategy: JwtDenylist
  has_many :news
  validates :email, confirmation: true 
end
