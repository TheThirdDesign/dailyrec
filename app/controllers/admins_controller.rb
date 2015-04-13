class AdminsController < ApplicationController

    def index
      if session[:admin_id]
        @drafts = Draft.where(admin_id: session[:admin_id])
        @posts = Post.all
        @faqs = Faq.all
        @users = User.all
      else
        redirect_to '/admin/login'
      end
    end

end
