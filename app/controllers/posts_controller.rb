class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def scrape
    begin
      @results = Yelp.client.search(params[:location], {limit: 5, category_filter: "donuts"})
    rescue Yelp::Error::UnavailableForLocation => e
      redirect_to root_url, notice: e.message and return
    end
    render :index
  end

  def home
  end

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 5)
    #@posts = Post.where("rating >= ?", params["rating"]).paginate(:page => params[:page], :per_page => 10) if params["rating"].present?
  end

  def show
#    @image = @post.image
  end

  def new
#    @post = Post.new
  end

  def edit
  end

  def create
=begin
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
=end
  end

  def update
=begin
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between action
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:phone, :image_url, :open, :location, :name, :rating, :latitude, :longitude)
    end
end
