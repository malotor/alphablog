require 'securerandom'

class Token
  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def self.generate
    return Token.new SecureRandom.uuid
  end

end
