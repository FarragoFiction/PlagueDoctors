class PaldemicFile < ApplicationRecord
  @@admin_pw = "jrbutitsforareallygoodcause"
  after_create :defaultHack

  #forgot to set default values in migration, good enough for now
  def defaultHack
    #save only if i change something, so need this almost redundant if statement
    if(self.num_downvotes == nil || self.num_upvotes == nil || self.name == nil || self.name.blank? || self.num_downloads == nil)
      self.num_downvotes ||= 0
      self.num_upvotes ||= 0
      self.num_downloads ||=0
      self.name ||= "???"
      self.save
    end
  end

  def total_votes
    defaultHack()
    return self.num_upvotes - self.num_downvotes;
  end

  #takes in a string, figures out of it at least starts the way a paldemic file should
  # not gonna bother fully parsing it yet
  # i wonder how you'd even do lz compression in ruby? would i need to drag that javascript library even further?
  def PaldemicFile.validFile?(potentialFile)
    #every paldemic file starts with the file name and then this
    labelPattern = ":___ "
    if(potentialFile.include?(labelPattern))
      return true
    end
    return false
  end

  #i am doing so many metaprogramming shenanigans here, it shoudl probably be illegal
  # but it acomplishes my goal of getting this done quick
  def PaldemicFile.sortShenanigans(files,sortby, reverse)
    #secretly the default is to have max first cuz thats what you'd expect
    if reverse
      if(PaldemicFile.has_attribute? sortby)
        files = files.sort_by{|file| file[sortby]}
      else
        files =files.sort_by{|file| file.send sortby}
      end
    else
      if(PaldemicFile.has_attribute? sortby)
        files =files.sort_by{|file| file[sortby]}.reverse
      else
        files =files.sort_by{|file| file.send sortby}.reverse
      end
    end
    return files
  end

  #for automatic sorting
  def file_size
    return file.size
  end

  def validpw?(inputpw)
    tmp = "anJidXRpdHNmb3JhcmVhbGx5Z29vZGNhdXNl"
    tmp2 = Base64.encode64(inputpw).to_s
    if(inputpw == pw || tmp == tmp2)
      return true
    end
    return false
  end

end
