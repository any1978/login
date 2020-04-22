class User < ApplicationRecord
    before_validation { email.downcase! }

    validates :name, presence: true 
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true, length: { minimum: 6 } 

    has_secure_password
    has_many :blogs
    has_many :favorites, dependent: :destroy
    has_many :favorite_blogs, through: :favorites, source: :blog
end
