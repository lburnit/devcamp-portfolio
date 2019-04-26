module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
      before_action :set_page_defaults
  end   

  def set_page_defaults
    @page_title = "Leon Ward's BurnIt Challenge"
    @seo_keywords = "Leon Ward burnit challenge"
  end    
end 

