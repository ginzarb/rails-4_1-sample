class UserMailerPreview < ActionMailer::Preview

  def registration
    @regist_url = "http://example/com"

    UserMailer.registration(@regist_url)
  end

end
