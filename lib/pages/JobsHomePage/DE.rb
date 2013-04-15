class JobsHomePageDE < JobsHomePage

  direct_url "#{DE_BASE_URL}"
  expected_title "Jobs in Berlin, Deutschland &amp; anderswo | Adzuna"

  category_tags.each { |category_tag|
      link_name = category_tag.gsub("-","_")
      link link_name, :xpath => "//div[@class='modal_links']//a[@href='#{DE_BASE_URL}browse/#{category_tag}']"
  }

end
