class User < ActiveRecord::Base
  enum status: [:active, :inactive, :deleted]
  validates :email, email_format: {message: 'invalid mail format'}

end
