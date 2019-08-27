class AllSeeingEye < ApplicationRecord

  def self.create_message object, message
    if(object != nil)
      return "{#{object.class.name},  #{object.id}}: #{message}";
    else
      return "{NONE} #{message}";
    end
  end

end
