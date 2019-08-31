class AllSeeingEye < ApplicationRecord

  #for now, only restricts Abdicate 13 times a day
  def self.timehole_accepts_ip? ip
    events = AllSeeingEye.where(created_at: 24.hours.ago..Time.now, ip: ip).where("message like ?", "%Abdicate%")
    if(events.count > self.abandon_limit)
      return false
    end
    return true
  end

  #calculated
  def self.abandon_limit
    if(TimeHole.all.count < 30)
      return  113
    elsif (TimeHole.all.count < 50)
      return 33
   elsif (TimeHole.all.count > 113)
          return 3
    end
    return 13
  end

  def self.create_message object, message
    if(object != nil)
      return "{#{object.class.name},  #{object.id}}: #{message}";
    else
      return "{NONE} #{message}";
    end
  end

end
