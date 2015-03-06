class AboutController < ApplicationController
  def show
    response = HTTParty.get('https://api.instagram.com/v1/users/self/media/recent/?access_token=1678934706.7497432.f3048715df0940b69ed625db492c45f5')
    @response = response["data"]
    @images = []
    @response.each do |image|
      imageURL = image["images"]["standard_resolution"]["url"]
      @images.push(imageURL)
    end
  end
end
