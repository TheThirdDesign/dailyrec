class UsersController < ApplicationController

def new
  @user = User.new
end

def create
    # Create the user from params

    @user = User.create(user_params)
    if @user.save
      # Deliver the signup email
      UserNotifier.send_signup_email(@user).deliver_now
      redirect_to '/'
    else
      render :action => 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :message)
    end

end
