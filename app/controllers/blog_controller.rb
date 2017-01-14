class BlogController < ApplicationController

  layout 'application'

  def index
    @posts = Post.all.where(category: 'Blog Post').where('publish_date <= ?', Time.now )
  end

end
