class User < ApplicationRecord
has_secure_password

validates :email, presence: :true
validates :email, uniqueness: true

# has_many :campaigns_users
has_many :campaigns # , through: :campaigns_users
has_many :characters
has_many :requests



end
