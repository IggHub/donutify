namespace :scraper do
  desc "Fetch food information from yelp API"
  task scrape: :environment do

    ###grabs individual posting data###
    result = Yelp.client.search('Moreno Valley', {limit: 3, category_filter: "donuts"})
    result.businesses.each do |business|
      puts business.name
    end
  end

  desc "TODO"
  task destroy_all_posts: :environment do
  end

end
