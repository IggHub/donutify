class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def scrape
    Post.destroy_all

    #the button will have a built-in logic:
    #if location is blank, search based on local coordinate (pos)
    #if location is NOT blank, search based on address given

    #this result is performed IF location is blank. This result is the result based on current coordinate
    #this result is performed IF location is not blank
    results = Yelp.client.search(params[:location], {limit: 5, category_filter: "donuts"})


    results.businesses.each do |result|
      #generate new post instance
      @post = Post.new
      @post.phone = result.phone
      @post.open = !result.is_closed
      @post.location = result.location.display_address.join(" ")
      @post.name = result.name
      @post.rating = result.rating
      @post.latitude = result.location.coordinate.latitude
      @post.longitude = result.location.coordinate.longitude
      @post.user_id = 1
      #save post information
      @post.save

      #images
      @image = Image.new
      @image.url = result.image_url
      @image.post_id = @post.id

      #save image
      @image.save

    end
    puts params.inspect
    redirect_to :posts
  end

  def home
  end
  # GET /posts
  # GET /posts.json
  def index
    @lat = params[:latitude]
    @lng = params[:longitude]

    @posts = Post.all.paginate(:page => params[:page], :per_page => 5)
    @posts = Post.where("rating >= ?", params["rating"]).paginate(:page => params[:page], :per_page => 10) if params["rating"].present?
    #@posts = Post.where(open: !params["open"]).paginate(:page => params[:page], :per_page => 10) if params["open"].present?
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow post.name
      marker.picture ({
        "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
        "width":  35,
        "height": 35
      })
      marker.json({name: post.name})
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @image = @post.image
  end

  # GET /posts/new
  def new
    @post = Post.new
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
      params.require(:post).permit(:phone, :image_url, :open, :location, :name, :rating, :latitude, :longitude)
    end
end
