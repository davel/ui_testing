class JobsAdvSearchDE < JobsAdvSearch

  direct_url "#{DE_BASE_URL}advanced-search"

  def get_distance_label dist_radious
    "im Umkreis von #{dist_radious}km"
  end 

end
