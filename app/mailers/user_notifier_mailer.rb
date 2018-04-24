class UserNotifierMailer < ApplicationMailer

  default from: 'noreply@nukes.com'

  def notify_president
    mail(to: User.last.email, subject: 'The russians have signed in!')
  end

  def notify_russians(user)
    @user = user
    mail(to: User.last.email, subject: "The #{@user} has signed in!")
  end

end
