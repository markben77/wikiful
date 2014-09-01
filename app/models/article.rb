class Article < ActiveRecord::Base
	belongs_to :user
	
	validate :title, presence: true
	validate :content, presence: true
	validate :categories, presence: true
	
	has_many :article_categories
	has_many :categories, through: :article_categories
end
