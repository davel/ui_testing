class JobsSearchResultsPage
  include PageObject

  div :search_results, :class => 'sh'
  text_field :search_box, :id => 'where'

  def search_for search_term
    self.search_box = search_term
    @browser.send_keys('{ENTER}')
  end

end
