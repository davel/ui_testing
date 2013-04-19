class JobsAdvSearch
  include PageObject

  text_field   :all_words,               :id => 'what_wrd_c'
  text_field   :exact_match,             :id => 'what_ph_c'
  text_field   :or_matches,              :id => 'what_or_c'
  text_field   :exclude_match,           :id => 'what_excl_c'
  text_field   :include_in_title,        :id => 'what_title_c'
  text_field   :company,                 :id => 'adv_c'

  radio_button :contract_type_permanent, :id => 'adv_contract_type_permanent'
  radio_button :contract_type_contract,  :id => 'adv_contract_type_contract'
  radio_button :contract_time_full_time, :id => 'adv_contract_time_full_time'
  radio_button :contract_time_part_time, :id => 'adv_contract_time_part_time'
  radio_button :freshness_1,             :id => 'adv_freshness_1'
  radio_button :freshness_3,             :id => 'adv_freshness_3'
  radio_button :freshness_7,             :id => 'adv_freshness_7'

  select_list :distance,                 :id => 'adv_dist'
  text_field  :location,                 :id => 'adv_l'

  a :search, :class => 'btn'

  def search_for criteria

    if criteria[:all_words].upcase != 'OFF'
        self.all_words = criteria[:all_words]
    end

    if criteria[:exact_match].upcase != 'OFF'
        self.exact_match = criteria[:exact_match]
    end

    if criteria[:or_matches].upcase != 'OFF'
        self.or_matches = criteria[:or_matches]
    end

    if criteria[:exclude_match].upcase != 'OFF'
        self.exclude_match = criteria[:exclude_match]
    end

    if criteria[:include_in_title].upcase != 'OFF'
        self.include_in_title = criteria[:include_in_title]
    end

    if criteria[:company].upcase != 'OFF'
        self.company = criteria[:company]
    end

    if criteria[:hours].eql? "parttime"
        select_contract_time_part_time
    elsif criteria[:hours].eql? "fulltime"
        select_contract_time_full_time
    end

    if criteria[:contract_type].eql? "permanent"
        select_contract_type_permanent
    elsif criteria[:contract_type].eql? "contract"
        select_contract_type_contract
    end

    case criteria[:freshness_days].to_i
        when 1
            select_freshness_1
        when 3
            select_freshness_3
        when 7
            select_freshness_7
        else
    end

    dist_radious = criteria[:radious].to_i
    if [5,10,25,50,100].include?(dist_radious)
        self.distance = self.get_distance_label dist_radious
        self.location = criteria[:location]
    end

    search
  end

  def get_distance_label dist_radious
    "within #{dist_radious} miles of"
  end
  
end
