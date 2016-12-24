namespace :scraper do
  desc "Fetch food information from yelp API"

  task :scrape, [:city] => [:environment] do |t, args|

    ###grabs individual posting data###
    results = Yelp.client.search(args[:city], {limit: 1, category_filter: "donuts"})
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
    puts results.businesses[0]
  end

  desc "destroys all posts instances"
  task destroy_all_posts: :environment do
    Post.destroy_all
  end

  desc "destroys all user instances"
  task destroy_all_users: :environment do
    User.destroy_all
  end

end
