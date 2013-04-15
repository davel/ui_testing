class JobsHomePageUK < JobsHomePage

  direct_url "#{UK_BASE_URL}jobs"
  expected_title "Jobs in London, the UK &amp; Beyond | Adzuna"

  category_tags.each { |category_tag|
      link_name = category_tag.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{UK_BASE_URL}jobs/browse/#{category_tag}']"
  }

end
