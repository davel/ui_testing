Given /^I am on the jobs home page$/ do
  visit JobsHomePage
end

Given /^I am on the jobs search result page$/ do
  visit JobsSearchResultsPage
end

When /^I search for jobs in (\w+)$/ do |search_term|
  on JobsSearchResultsPage do |page| page.search_for search_term end
end

When /^I search for jobs_sr in (\w+)$/ do |search_term|
  on JobsSearchResultsPage do |page| page.search_for search_term end
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  on JobsSearchResultsPage do |page|
      got_results = page.search_results.gsub(",","")
      got_results.to_i.should >= exp_num_results.to_i
  end
end
