class User < ApplicationRecord
    attr_accessor :invitation
    # destroy all articles when user is destroyed
    has_many :articles, dependent: :destroy
    has_one :invitation

    before_save { self.email  = email.downcase }

    validates :username, presence: true, uniqueness: { case_sensitive: false } , length: { minimun: 3, maximum: 25 }

    VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 125 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGX }

    has_secure_password

end
