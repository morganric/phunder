class UserMailer < ActionMailer::Base
  default from: "phunderapp@gmail.com"

  def donation_email(email, user, campaign, photo)
    @email = email
    @user = user
    @campaign = campaign
    @photo = photo
    @url  = 'http://phunderapp.com/campaigns/#{}'
    mail(to: @user.email, subject: 'New Phunder App Donation')
  end

end
