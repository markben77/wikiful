class User < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true
	validates_uniqueness_of :email
	has_many :articles
end
