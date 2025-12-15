module ApplicationHelper
  def full_title(page_title = '')         # Method definition with optional argument
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?                  # Boolean test
      base_title                          # Implicit return
    else
      "#{page_title} | #{base_title}"     # String interpolation
    end
  end

end
