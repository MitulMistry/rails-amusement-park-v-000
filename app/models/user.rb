class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  
  after_initialize :init

  def init
    self.admin = false if self.admin.nil?
  end

  def mood
    if self.nausea && self.happiness
      if self.nausea > self.happiness
        "sad"
      elsif self.happiness > self.nausea
        "happy"
      end
    else
      "neutral"
    end
  end
end
