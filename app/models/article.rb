class Article < ActiveRecord::Base
	validate :title, presence: true
	validate :content, presence: true
	validate :categories, presence: true
	belongs_to :users
	has_many :article_categories
	has_many :categories, through: :article_categories
end
