Given /^I am on the jobs home page$/ do
  visit JobsHomePage
  @visited_page = JobsHomePage
end

Given /^I am on the jobs search result page$/ do
  visit JobsSearchResultsPage
  @visited_page = JobsSearchResultsPage
end

When /^I search for jobs in (\w+)$/ do |search_term|
  on @visited_page do |page| page.search_for search_term end
end

When /^I browse jobs category (.*?)$/ do |category|
  on @visited_page do |page|
     page.go_to_browse_page category
  end
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  on JobsSearchResultsPage do |page|
      got_results = page.search_results.gsub(",","")
      got_results.to_i.should >= exp_num_results.to_i
  end
end

Then /^I should get the browse (.*?) page$/ do |category|
  on JobsBrowsePage do |page|
    category_name = category.gsub("-"," ")
    page.header.should match(%r{Browse #{category_name}}i)
  end
end
