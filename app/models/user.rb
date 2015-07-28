class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :photo, PhotoUploader
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :trips
  has_many :saved_locations, through: :trips



  # validates :photo, presence: true


end
