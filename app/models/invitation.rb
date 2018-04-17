class Invitation < ApplicationRecord

  has_one :user

  before_save { self.email_recipient  = email_recipient.downcase }

  VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_recipient, presence: true, length: { maximum: 125 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGX }
  validates :token, presence: true

  def initialize(attributes={})
    attributes[:token] ||= Token.generate
    super attributes
  end


  # def accepted_by(user)
  #   @user = user
  #   @accepted = true
  # end

end
