require 'rails_helper'

describe PostsController do
  describe "POST scrape" do
    it "creates new restaurant attributes from yelp"
    it "saves new restaurant attributes from yelp`"

    it "redirect to Posts index" do
      Post.destroy_all
      results = Yelp.client.search('moreno valley', {limit: 1, category_filter: "donuts"})
      post :scrape
      response.should redirect_to(action: 'index')
    end
  end
end
