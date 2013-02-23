class JobsHomePage
  include PageObject

  direct_url "#{UK_BASE_URL}jobs"
  expected_title "Jobs in London, the UK &amp; Beyond | Adzuna"

  text_field :search_box, :id => 'w'
  a :search, :class => 'subm'

  div :category_list, :class => 'hc'

  # XXX Move categories in a config file
  categories = ['it-jobs', 'engineering-jobs']
  categories.each { |category|
      link_name = category.gsub("-","_")
      link link_name, :href => "#{UK_BASE_URL}jobs/browse/#{category}"
  }

  def search_for search_term
    self.search_box = search_term
    search
  end

  def go_to_browse_page category
    category_link = category.gsub("-","_")
    eval category_link
  end

end
