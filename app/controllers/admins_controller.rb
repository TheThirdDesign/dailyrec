class AdminsController < ApplicationController

    def index
      if session[:admin_id]
        @drafts = Draft.all
        @posts = Post.all
      else
        redirect_to '/admin/login'
      end
    end

end
