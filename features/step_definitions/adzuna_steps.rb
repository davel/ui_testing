Given /^I am on the jobs (\w\w) home page$/ do |country|
  visit eval("JobsHomePage#{country}")
  @visited_page = eval("JobsHomePage#{country}")
end

Given /^I am on the jobs search result page$/ do
  visit JobsSearchResultsPage
  @visited_page = JobsSearchResultsPage
end

Given /^I am on the jobs (\w\w) advanced search page$/ do |country|
  visit eval("JobsAdvSearch#{country}")
  @visited_page = eval("JobsAdvSearch#{country}")
end

When /^I search for jobs in (\w+)$/ do |search_term|
  on @visited_page do |page| page.search_for search_term end
end

When /^I search for jobs with this criteria: (\d+), (\w+), (\w+)$/ do |radious, contract_type, hours|
  on @visited_page do |page|
     page.search_for  :contract_type => contract_type,
                      :radious       => radious,
                      :hours         => hours
  end
end

Then /^I should be able to get to the browse categories page$/ do
  on @visited_page do |page|
     page.categories.each do |category|
        page.show_categories
        page.go_to_browse_page category,@visited_page.country_code
        on JobsBrowsePage do |cat_page|
            category_name = category.label
            cat_page.header.should match(%r{#{category_name}}i)
        end
        visit @visited_page
     end
  end
end

Then /^I should see at least ([\d,]+) results$/ do |exp_num_results|
  on JobsSearchResultsPage do |page|
      got_results = page.search_results.gsub(",","") # Remove comma thousand separator
      got_results = got_results.gsub(".","")         # Remove dot thousand separator
      got_results.to_i.should >= exp_num_results.to_i
  end
end

Then /^I should see at least ([\d,]+) results from adv page$/ do |exp_num_results|
  on @visited_page do |page|
      got_results = page.search_results.gsub(",","")
      got_results.to_i.should >= exp_num_results.to_i
  end
end
