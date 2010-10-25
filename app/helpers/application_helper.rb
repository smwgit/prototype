module ApplicationHelper
  
  def title
    base_title = "Longhorn Sequencing Database Prototype"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("longhorn-sequence.png", :alt => "The Longhorn Sequencing Database", :class => "round", :size => 10, :height => "15%")
  end
end
