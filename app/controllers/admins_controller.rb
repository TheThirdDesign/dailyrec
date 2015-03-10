class AdminsController < ApplicationController
  def index
    @posts = Post.all
  end
end
