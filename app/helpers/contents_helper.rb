module ContentsHelper
  
  def getHomepage(content)
    if(content.ancestry)
      homepage_id = @content.ancestry.gsub(/\/.*/,"")
      @homepage = Content.find(homepage_id)
    else
      @homepage = content
    end
  end
end
