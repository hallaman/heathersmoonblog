class BlogController < ApplicationController

  layout 'application'

  def index
    @posts = Post.all.where(category: 'Blog Post')
  end

end
