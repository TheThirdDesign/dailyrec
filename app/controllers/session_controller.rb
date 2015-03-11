class SessionController < ApplicationController
  def new
    render :new, :layout => 'admins'
  end

  def create
        admin = Admin.find_by(adminname: params[:adminname])

        if admin && admin.authenticate(params[:password])
            @message = false
            session[:admin_id] = admin.id
            session[:adminname] = params[:adminname]
            redirect_to '/admin'
        else
            @error = true
            render :new
        end
    end

  def destroy
    reset_session
    @message = false
    redirect_to '/admin/login'
  end
end
