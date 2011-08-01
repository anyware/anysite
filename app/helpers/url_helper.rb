module UrlHelper
  
  ACCENTS_MAPPING = {
      'E' => [200,201,202,203],
      'e' => [232,233,234,235],
      'A' => [192,193,194,195,196,197],
      'a' => [224,225,226,227,228,229,230],
      'C' => [199],
      'c' => [231],
      'O' => [210,211,212,213,214,216],
      'o' => [242,243,244,245,246,248],
      'I' => [204,205,206,207],
      'i' => [236,237,238,239],
      'U' => [217,218,219,220],
      'u' => [249,250,251,252],
      'N' => [209],
      'n' => [241],
      'Y' => [221],
      'y' => [253,255],
      'AE' => [306],
      'ae' => [346],
      'OE' => [188],
      'oe' => [189]
    }

  STRIPPABLE = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16, 17, 18, 19,
      20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 33, 34, 35, 36, 37, 38, 39,
      40, 41, 42, 43, 44, 45, 46, 47, 58, 59, 60, 61, 62, 63, 64, 91, 92, 93, 94,
      96, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136,
      137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151,
      152, 153, 154, 155, 156, 157, 158, 159, 161, 162, 163, 164, 165, 166, 167,
      168, 169, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 182, 183, 184,
      185, 187, 188, 189, 190, 191, 215, 247, 8203, 8204, 8205, 8239, 65279]
  
  def self.slug(name)
    self.removeaccents (name.unpack("U*") - STRIPPABLE).pack("U*").gsub("-", " ").squeeze(" ").strip.downcase.gsub(/\s/u, '-')
  end
  
  def self.removeaccents(str)
    ACCENTS_MAPPING.each {|letter,accents|
      packed = accents.pack('U*')
      rxp = Regexp.new("[#{packed}]", nil, 'U')
      str.gsub!(rxp, letter)
    }

    str
  end
  
  def self.url(object, name)
    if object.parent_id
      ancestry_ary = object.ancestry.split('/').drop(1) 
      url = String.new
      ancestry_ary.each { |object_id|
        url << "/" if url.length > 0
        url << object.class.find(object_id.to_i).slug
      }
      url << "/" if url.length > 0
      url << (name.nil? ? object.slug : slug(name))
      url
    end
  end
  
  def self.update_children_urls(object)
    object.children.each { |child|
      child.url = UrlHelper.url(child, nil)
      self.update_children_urls(child) if child.save
    }
  end

end
