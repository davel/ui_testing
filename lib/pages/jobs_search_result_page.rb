class JobsSearchResultsPage
  include PageObject

  direct_url "#{UK_BASE_URL}/jobs/search?"
  expected_title 'London Jobs - Adzuna.co.uk'

  div :search_results, :class => 'sh'
  text_field :search_box, :id => 'where'

  def search_for search_term
    self.search_box = search_term
    @browser.send_keys('{ENTER}')
  end

end
