class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :destroy]

  def upvote 
    @comment = Comment.find_by_id(params[:id])
    @comment.likes = @comment.likes.present? ? @comment.likes + 1 : 1
    @comment.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { count: @comment.likes, id: @comment.id } }
    end
  end  

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.hash_tree(limit_depth: 4)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new(parent_id: params[:parent_id], post_id: params[:post_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = Comment.new(comment_params)

    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end

    
    # @comment = @post.comments.create(comment_params_with_post)
    # redirect_to @post

    @post = Post.find(params[:post_id])

    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = @post.comments.create(comment_params_with_post)
    end

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to post_url(@post)
    else
      flash[:warning] = 'Please enter name and comment before posting.'
      redirect_to post_url(@post)
      #render 'new'
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :link, :body, :post_id)
    end

    def comment_params_with_post
       comment_params.merge(post: @post)
    end
end
