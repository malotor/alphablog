class Invitation < ApplicationRecord

  #attr_accessor :token
  belongs_to :user

  before_save { self.email_recipient  = email_recipient.downcase }

  VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_recipient, presence: true, length: { maximum: 125 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGX }
  validates :token, presence: true

  def initialize(attributes={})
    attributes[:token] ||= Token.generate
    super attributes
  end

  # after_initialize do |invitation|
  #   puts "init"
  #   invitation.token ||= Token.generate
  # end
  #
  # after_create do |invitation|
  #     puts "create"
  #   invitation.token ||= Token.generate
  # end


end
