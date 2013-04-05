class JobsHomePageUK < JobsHomePage

  direct_url "#{UK_BASE_URL}jobs"
  expected_title "Jobs in London, the UK &amp; Beyond | Adzuna"

  # XXX Move categories in a config file
  categories = ['it-jobs', 'sales-jobs']
  categories.each { |category|
      link_name = category.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{UK_BASE_URL}jobs/browse/#{category}']"
  }

  def categories_list
    #TODO: Plug into DB
    ['it-jobs', 'sales-jobs']
  end

end
