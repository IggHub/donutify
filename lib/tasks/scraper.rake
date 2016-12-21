namespace :scraper do
  desc "Fetch food information from yelp API"
  task scrape: :environment do

    ###grabs individual posting data###
    results = Yelp.client.search('San Diego', {limit: 10, category_filter: "donuts"})
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
  end

  desc "TODO"
  task destroy_all_posts: :environment do
  end

end
