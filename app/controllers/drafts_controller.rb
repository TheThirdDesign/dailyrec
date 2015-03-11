class DraftsController < ApplicationController

  def new
      @draft = Draft.new
      render :layout => 'admins'
  end

  def edit
    @draft = Draft.find_by(id: params[:id])
    render :layout => 'admins'
  end

  def destroy
    draft = Draft.find_by(id: params[:id])
    draft.destroy
    redirect_to '/admin'
  end

  def update
    
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
  end

  def create
    if params[:commit] == "SAVE"
      @draft = Draft.create(draft_params)
      redirect_to '/admin'
    elsif params[:commit] == "PUBLISH"
      @post = Post.create(draft_params)
      redirect_to '/admin'
    end
  end

  private
    def draft_params
      params.require(:draft).permit(:title, :date, :teaser, :content, :pictures, :category, :layout)
    end

end
