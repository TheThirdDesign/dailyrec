class UserNotifier < ActionMailer::Base
  default :from => "<%= @user.email %>"

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => "jacksrf@gmail.com",
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
