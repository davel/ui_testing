class JobsAdvSearch
  include PageObject

  radio_button :contract_type_permanent, :id => 'adv_contract_type_permanent'
  radio_button :contract_type_contract,  :id => 'adv_contract_type_contract'
  radio_button :contract_time_full_time,  :id => 'adv_contract_time_full_time'
  radio_button :contract_time_part_time,  :id => 'adv_contract_time_part_time'

  a :search, :class => 'btn'

  def search_for criteria
    if criteria[:hours].eql? "part time"
        select_contract_time_part_time
    else
        select_contract_time_full_time
    end

    if criteria[:contract_type].eql? "permanent"
        select_contract_type_permanent
    else
        select_contract_type_contract
    end
    search
  end

end
