class Token
  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def self.generate
    return 'atoken'
  end

end
