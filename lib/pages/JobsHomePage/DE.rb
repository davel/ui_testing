class JobsHomePageDE < JobsHomePage

  direct_url "#{DE_BASE_URL}"
  expected_title "Jobs in Berlin, Deutschland &amp; anderswo | Adzuna"

  # XXX Move categories in a config file
  categories = ['stellen-aus-fertigung', 'stellen-aus-fertigung']
  categories.each { |category|
      link_name = category.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{DE_BASE_URL}browse/#{category}']"
  }

  def categories_list
    #TODO: Plug into DB
    ['stellen-aus-fertigung', 'stellen-aus-fertigung']
  end

end
