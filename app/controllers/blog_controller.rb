class BlogController < ApplicationController

  layout 'application'

  def index

	  if params[:search]
	    @posts = Post.all.where(category: 'Blog Post').where('publish_date <= ?', Time.now ).search(params[:search]).order("created_at DESC")
	  else
	    @posts = Post.all.where(category: 'Blog Post').where('publish_date <= ?', Time.now )
	  end
	end
end
