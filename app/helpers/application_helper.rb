module ApplicationHelper
  # Returns the full title of a per-page basic.
  include SessionsHelper

  def full_title(page_title = '')
    base_title = "Sample Blog App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
