class UserNotifier < ActionMailer::Base

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :from => @user.email,
    :to => "wahlbrooke@gmail.com",
    :subject => 'Somone just contacted you' )
  end

  def send_match_email(matchuser)
    @matchuser = matchuser
    mail(:from => "wahlbrooke@gmail.com",
    :to => @matchuser.email,
    :subject => 'Thanks for Signing in!' )
  end
end
