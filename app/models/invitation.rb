class Invitation < ApplicationRecord

  before_save { self.email_recipient  = email_recipient.downcase }

  VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_recipient, presence: true, length: { maximum: 125 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGX }


  after_initialize do |invitation|
    invitation.token ||= Token.generate
  end

  def token
     Token.new @token
  end
end
