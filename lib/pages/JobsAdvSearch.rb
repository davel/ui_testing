class JobsAdvSearch
  include PageObject

  radio_button :contract_type_permanent, :id => 'adv_contract_type_permanent'
  radio_button :contract_type_contract,  :id => 'adv_contract_type_contract'
  radio_button :contract_time_full_time, :id => 'adv_contract_time_full_time'
  radio_button :contract_time_part_time, :id => 'adv_contract_time_part_time'
  radio_button :freshness_1,             :id => 'adv_freshness_1'
  radio_button :freshness_3,             :id => 'adv_freshness_3'
  radio_button :freshness_7,             :id => 'adv_freshness_7'

  a :search, :class => 'btn'

  def search_for criteria
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

    search
  end

end
