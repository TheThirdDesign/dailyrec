class UserNotifier < ActionMailer::Base

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :from => @user.email,
    :to => "wahlbrook@gmail.com",
    :subject => 'Somone just contacted you' )
  end

  def send_match_email(matchuser)
    @matchuser = matchuser
    mail(:from => "wahlbrooke@gmail.com",
    :to => @matchuser.email,
    :subject => 'MATCH MADNESS' )
  end

  def send_update_email(user, post)
    @user = user
    @post = post
    mail(:from => "thedailyrec@gmail.com",
    :to => @user.email,
    :subject => 'The Daily Rec has a new post!' )
  end
end
