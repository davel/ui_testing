#### GIVEN

Given /^I am on the jobs (\w\w) home page$/ do |country|
  visit eval("JobsHomePage#{country}")
  @visited_page = eval("JobsHomePage#{country}")
end

Given /^I am on the jobs (\w\w) search result page$/ do |country|
  visit eval("JobsSearchResultsPage#{country}")
  @visited_page = eval("JobsSearchResultsPage#{country}")
end

Given /^I am on the jobs (\w\w) advanced search page$/ do |country|
  visit eval("JobsAdvSearch#{country}")
  @visited_page = eval("JobsAdvSearch#{country}")
end

Given /^I am on the jobs (\w\w) (\w+) stats page$/ do |country, stats_type|
  page_name = "JobStats#{stats_type.capitalize}#{country}"
  visit eval(page_name) do |page|
    @visited_page = page
  end
end

#### WHEN

When /^I search for jobs in (\w+)$/ do |search_term|
  on @visited_page do |page| page.search_for search_term end
end

When /^I search for jobs with this criteria: (\d+) from (\w+), (\w+), (\w+), (\d+), (\w+), (\w+), (\w+), (\w+), (\w+), (\w+), (\d+), (\w+)$/ do |radious, location, contract_type, hours, freshness_days, all_words, exact_match, or_matches, exclude_match, include_in_title, company, per_page, sorting|
  on @visited_page do |page|
     page.search_for  :contract_type     => contract_type,
                      :radious           => radious,
                      :location          => location,
                      :hours             => hours,
                      :freshness_days    => freshness_days,
                      :all_words         => all_words,
                      :exact_match       => exact_match,
                      :or_matches        => or_matches,
                      :exclude_match     => exclude_match,
                      :include_in_title  => include_in_title,
                      :company           => company,
                      :per_page          => per_page,
                      :sorting           => sorting
  end
end

#### THEN

Then /^I should be able to get to the browse categories page$/ do
  on @visited_page do |page|
     page.categories.each do |category|
        page.show_categories
        page.go_to_browse_page category,@visited_page.country_code
        on JobsBrowsePage do |cat_page|
            cc = page.class.country_code
            tag_column = "category.tag_#{cc}"
            category_name = Category.get_label_from_tag eval(tag_column)
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

Then /^I should be able to see stats$/ do
  not_found_string = @visited_page.get_not_found_string
  @visited_page.title.should_not match(not_found_string)
end
