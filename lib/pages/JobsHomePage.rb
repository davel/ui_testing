class JobsHomePage
  include PageObject

  text_field :search_box, :id => 'w'
  a :search, :class => 'subm'
  a :show_categories, :id => 'trigger_categories'
  div :category_list, :class => 'hc'

  def search_for search_term
    self.search_box = search_term
    search
  end

  def go_to_browse_page category
    category_link = category.gsub("-","_")
    eval category_link
  end

end
