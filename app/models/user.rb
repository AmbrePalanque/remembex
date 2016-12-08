class User < ApplicationRecord
  has_secure_password
  has_many :exes

  validates :name, presence: true
  validates :email, presence: true, format: /\A[a-z0-9_\-\.]+@[a-z0-9_\-\.]+\.[a-z]+\z/i
  validates :password, presence: true, confirmation: true
end
