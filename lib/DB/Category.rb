class Category < ActiveRecord::Base
  self.table_name = 'Category'

  def self.get_all
    categories = self.find_all_by_context('jobs');
  end

  def self.get_all_tags country_code
    categories = self.find_all_by_context('jobs');
    
    tags = []
    categories.each do |category|
        tag_column = "category.tag_#{country_code}"
        tags.push(eval tag_column)
    end
    tags
  end
end
