class JobStatsRangedistributionDE < JobStats

  direct_url "#{DE_BASE_URL}get_stats?data_set=Rangedistribution&months=6"

  def get_not_found_string
    'Seite nicht gefunden'
  end

end
