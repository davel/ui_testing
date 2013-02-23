class JobsHomePage
  include PageObject
  
  direct_url "#{UK_BASE_URL}jobs"
  expected_title "Jobs in London, the UK &amp; Beyond | Adzuna"

  text_field :search_box, :id => 'w'

  def search_for search_term
    self.search_box = search_term
    @browser.send_keys('{ENTER}')
  end

end
