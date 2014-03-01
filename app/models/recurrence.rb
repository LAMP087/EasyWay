class Recurrence < ActiveRecord::Base
	include IceCube

  attr_accessible :repetition
  
  has_many :events
  
  validate :date_validation

  serialize :repetition, Hash

  def repetition=(new_rec)
	  if new_rec == "{}"
	    write_attribute(:repetition, nil)
	  else	    
      write_attribute(:repetition, RecurringSelect.dirty_hash_to_rule(new_rec).to_hash)
	  end
	end

end
