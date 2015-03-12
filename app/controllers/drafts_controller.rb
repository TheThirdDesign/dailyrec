class DraftsController < ApplicationController
  def new
    if session[:admin_id]
      @draft = Draft.new
      binding.pry
      render :layout => 'admins'
    else
      redirect_to '/admin/login'
    end
  end

  def edit
    if session[:admin_id]
      @draft = Draft.find_by(id: params[:id])
      render :layout => 'admins'
    else
      redirect_to '/admin/login'
    end
  end

  def destroy
    if session[:admin_id]
      draft = Draft.find_by(id: params[:id])
      draft.delete
      redirect_to '/admin'
    else
      redirect_to '/admin/login'
    end
  end

  def update
    if session[:admin_id]
      if params[:commit] == "SAVE"
        draft = Draft.find_by(id: params[:id])
        draft.update(draft_params)
        draft.save
        redirect_to '/admin'
      elsif params[:commit] == "PUBLISH"
        @post = Post.create(draft_params)
        draft = Draft.find_by(id: params[:id])
        draft.destroy
        redirect_to '/admin'
      end
    else
      redirect_to '/admin/login'
    end
  end

  def create

    if session[:admin_id]

      if params[:commit] == "SAVE"
        @draft = Draft.create(draft_params)
          if @draft.save
            redirect_to '/admin'
          else
            render :new
          end
      elsif params[:commit] == "PUBLISH"
        binding.pry
        @post = Post.create(draft_params)
        redirect_to '/admin'
      else
        redirect_to '/admin/login'
      end

    end
  end

  private
    def draft_params
      params.require(:draft).permit(:title, :date, :teaser, :content, :pictures, :admin_id, :category, :layout)
    end

end
