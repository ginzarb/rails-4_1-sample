class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user.registration.subject
  #
  def registration(regist_url)
    @regist_url = regist_url

    mail to: "to@example.org"
  end
end
