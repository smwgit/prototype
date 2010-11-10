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
    image_tag("longhorn-sequence-sm.png", :alt => "The Longhorn Sequencing Database", :class => "round")
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :showAll => toggle_state}, {:class => css_class}
  end
  
  def toggleable()
    showAll = (toggle_state == "no" ? "yes" : "no")
    text = (toggle_state == "yes" ? "Hide extra columns" : "Show all columns")
    link_to text, {:sort => sort_column, :direction => sort_direction, :showAll => showAll}
  end
end
