class DB
  include Singleton

  def connect
   @handles = ActiveRecord::Base.establish_connection(
                    :adapter  => 'mysql2',
                    :host     => 'localhost',
                    :database => 'adzuna_core'
              ) 
  end   

end
