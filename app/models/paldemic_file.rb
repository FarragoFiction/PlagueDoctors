class PaldemicFile < ApplicationRecord
  @@admin_pw = "jrbutitsforareallygoodcause"

  #takes in a string, figures out of it at least starts the way a paldemic file should
  # not gonna bother fully parsing it yet
  # i wonder how you'd even do lz compression in ruby? would i need to drag that javascript library even further?
  def PaldemicFile.validFile?(potentialFile)
    #every paldemic file starts with the file name and then this
    labelPattern = ":___ "
    if(potentialFile.contains(labelPattern))
      return true
    end
    return false
  end
end
