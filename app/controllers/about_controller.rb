class AboutController < ApplicationController
  def show
    response = HTTParty.get('https://api.instagram.com/v1/users/self/media/recent/?access_token=1678934706.7497432.f3048715df0940b69ed625db492c45f5')
    @response = response["data"]
    @images = []
    @counter = 1
    @response.each do |image|
      if @counter <= 5
      imageURL = image["images"]["standard_resolution"]["url"]
      @images.push(imageURL)
    end
    @counter += 1
  end
  end
end
