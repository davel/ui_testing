# encoding: utf-8
class JobsAdvSearchDE < JobsAdvSearch

  direct_url "#{DE_BASE_URL}advanced-search"

  def get_distance_label dist_radious
    "im Umkreis von #{dist_radious}km"
  end 

  def get_sorting_label sorting
    tag_to_label = {
        'relevant' => 'Relevanteste',
        'recent'   => 'Neueste',
        'salary_h' => 'Höchstes Gehalt',
        'salary_l' => 'Niedrigstes Gehalt'    
    }
    tag_to_label[sorting]
  end

end
