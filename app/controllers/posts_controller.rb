require 'gibbon'
require 'social_shares'

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show, :upvote]

  def upvote 
    @post = Post.find_by_id(params[:id])
    @post.likes = @post.likes.present? ? @post.likes + 1 : 1
    @post.save
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: { count: @post.likes, id: @post.id } }
    end
  end  

  def send_campaign 
    @post = Post.find(params[:id])
    @post_body_title = '<span class="h1">'+@post.title+'</span>'+@post.body

    # API key in initializers/gibbon.rb
    gibbon = Gibbon::Request.new 

    recipients = {
      list_id: "1a93406f49"
    }
    settings = {
      subject_line: @post.title,
      title: @post.title,
      from_name: "KV",
      reply_to: "KV@aquariusnation.com"
    }

    @campaign_body = {
      type: "regular",
      recipients: recipients,
      settings: settings
    }

    @email_body = {
      template: {
        id: 153317,
        sections: {
          "std_preheader_content": @post.title,
          "std_content00": @post_body_title
        }
      }
    }

    begin
      @new_campaign = gibbon.campaigns.create(body: @campaign_body)
      @new_campaign_id = @new_campaign["id"]
      gibbon.campaigns(@new_campaign_id).content.upsert(body: @email_body)
      gibbon.campaigns(@new_campaign_id).actions.send.create

      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Sent to MailChimp list!' }
        format.json { render :index }
      end
    rescue Gibbon::MailChimpError => e
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "Houston, we have a problem: #{e.message} - #{e.raw_body}" }
        format.json { render json: :index, status: :unprocessable_entity }
      end
    end

  end 

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order('publish_date DESC')
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.hash_tree(limit_depth: 4)

    @url = URI.parse(request.base_url).to_s + '/posts/' + @post.id.to_s + '?locale=en'
    @facebook_count = SocialShares.facebook @url
    @pinterest_count = SocialShares.pinterest @url
    @google_count = SocialShares.google @url
    @facebook_count ||= 0
    @pinterest_count ||= 0
    @google_count ||= 0
    @sum = @facebook_count + @pinterest_count + @google_count 

    if @post.category == 'Blog Post'
      @title = @post.title 
    else 
      @title = 'Daily Moon Vibe Reading'
    end

    @latest = Post.where(category: 'Blog Post').where('publish_date <= ? AND id != ?', Time.now, @post.id ).order("created_at DESC").limit(3)

  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.publish_date = Time.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:short_title, :title, :body, :main_image, :category, :publish_date, :likes)
    end
end
