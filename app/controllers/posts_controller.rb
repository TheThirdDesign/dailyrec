class PostsController < ApplicationController
def index
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
    if session[:admin_id]
      @post = Post.find_by(id: params[:id])
      render :layout => 'admins'
    else
      redirect_to '/admin/login'
    end
  end

  def update
    if session[:admin_id]
      post = Post.find_by(id: params[:id])
      post.update(post_params)
      post.save
      redirect_to '/admin'
    else
      redirect_to '/admin/login'
    end
  end

  def destroy
    if session[:admin_id]
      post = Post.find_by(id: params[:id])
      post.destroy
      redirect_to '/admin'
    else
      redirect_to '/admin/login'
    end
  end

  def new
    if session[:admin_id]
      @post = Post.new
      render :layout => 'admins'
    else
      redirect_to '/admin/login'
    end
  end

  def create
    if session[:admin_id]
      @post = Post.create(post_params)
      redirect_to '/admin'
    else
      redirect_to '/admin/login'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :date, :teaser, :content, :pictures, :category, :layout)
    end
end
