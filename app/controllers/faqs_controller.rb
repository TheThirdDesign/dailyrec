class FaqsController < ApplicationController

  def index
    @faqs = Faq.all
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

  def new
    if session[:admin_id]
      @faq = Faq.new
      render :layout => 'admins'
    else
      redirect_to '/admin/login'
    end
  end

  def create
    if session[:admin_id]
      @faq = Faq.create(faq_params)
      redirect_to '/admin'
    else
      redirect_to '/admin/login'
    end
  end

    def edit
      if session[:admin_id]
        @faq = Faq.find_by(id: params[:id])
        render :layout => 'admins'
      else
        redirect_to '/admin/login'
      end
    end

    def update
      if session[:admin_id]
        faq = Faq.find_by(id: params[:id])
        faq.update(faq_params)
        faq.save
        redirect_to '/admin'
      else
        redirect_to '/admin/login'
      end
    end

  def destroy
    if session[:admin_id]
      faq = Faq.find_by(id: params[:id])
      faq.destroy
      redirect_to '/admin'
    else
      redirect_to '/admin/login'
    end
  end

  private
    def faq_params
      params.require(:faq).permit(:question, :answer, :admin_id)
    end
end
