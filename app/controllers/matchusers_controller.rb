class MatchusersController < ApplicationController

  def index
    binding.pry
    if params["format"] == "csv"
      @matchusers = Matchuser.order(:name)
      respond_to do |format|
        format.html
        format.csv { send_data @matchusers.to_csv }
      end
    else
      render :layout => 'match'
    end
  end


  def new
    @matchuser = Matchuser.new
    render :layout => 'match'
  end

  def create
    @matchuser = Matchuser.create(matchuser_params)
    if @matchuser.save
      # Deliver the signup email
      UserNotifier.send_match_email(@matchuser).deliver
      redirect_to matchusers_path
    else
      render :action => 'new'
    end

  end

  private
    def matchuser_params
      params.require(:matchuser).permit(:name, :email, :specialty, :phone)
    end
end
