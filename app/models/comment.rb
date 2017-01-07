class Comment < ActiveRecord::Base
	belongs_to :post

	acts_as_tree order: 'created_at DESC'

	acts_as_votable

	validates :author, presence: true
	validates :body, presence: true
	validates :post_id, presence: true


end
