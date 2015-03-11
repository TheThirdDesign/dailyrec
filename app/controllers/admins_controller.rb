class AdminsController < ApplicationController
  def index
    @drafts = Draft.all
    @posts = Post.all
  end
end
