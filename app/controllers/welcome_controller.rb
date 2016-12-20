class WelcomeController < ApplicationController
  def index
  end

=begin
## search is built in into yelp api!
  def search
    parameters = { term: params[:term], limit: 16 }
    render json: Yelp.client.search('San Francisco', parameters)
  end
=end

end
