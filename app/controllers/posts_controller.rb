class PostsController < ApplicationController
def index
  binding.pry
    if params["type"] == "favorites"
      @posts = Post.where(category: "favorites").order("created_at DESC")
      @count = params["count"].to_i
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
  elsif params["type"] == "home"
      @posts = Post.where(category: "home").order("created_at DESC")
      @count = params["count"].to_i
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
  elsif params["type"] == "stories"
        @posts = Post.where(category: "stories").order("created_at DESC")
        @count = params["count"].to_i
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
    elsif params["search"]
        @posts = Post.text_search(params["search"])
        @count = params["count"].to_i
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

  def show
    @post = Post.find_by(id: params[:id])
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

  def edit
    @post = Post.find_by(id: params[:id])
    render :layout => 'admins'
  end

  def update
    post = Post.find_by(id: params[:id])
    post.update(post_params)
    post.save
    redirect_to '/admin'
  end

  def new
    @post = Post.new
    render :layout => 'admins'
  end

  def create
    binding.pry
    @post = Post.create(post_params)
    redirect_to '/admin'
  end

  private
    def post_params
      params.require(:post).permit(:title, :date, :teaser, :content, :pictures, :category, :layout)
    end
end
