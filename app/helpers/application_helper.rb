module ApplicationHelper
  
  def title
    base_title = "FGStream RNA-seq Database Prototype"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "The Functional Genomics Research Stream", :class => "round", :size => 10)
  end
end
