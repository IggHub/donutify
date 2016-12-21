namespace :scraper do
  desc "Fetch food information from yelp API"

  task :scrape, [:city] => [:environment] do |t, args|

    ###grabs individual posting data###
    results = Yelp.client.search(args[:city], {limit: 10, category_filter: "donuts"})
    results.businesses.each do |result|
      #generate new post instance
      @post = Post.new
      @post.phone = result.phone
      @post.image_url = result.image_url
      @post.open = !result.is_closed
      @post.location = result.location.display_address.join(" ")
      @post.name = result.name
      @post.rating = result.rating

      #save post information
      @post.save
    end
    puts results.businesses[0]
  end

  desc "TODO"
  task destroy_all_posts: :environment do
    Post.destroy_all
  end

end
