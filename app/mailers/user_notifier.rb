class UserNotifier < ActionMailer::Base

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :from => @user.email,
    :to => "wahlbrooke@gmail.com",
    :subject => 'Somone just contacted you' )
  end
end
