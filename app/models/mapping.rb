class Mapping < ActiveRecord::Base
  attr_accessible :notify_observer_property_id, :notify_template_id, :template_parameter
  
  belongs_to :notify_observer_property, :foreign_key => :notify_observer_property_id
  belongs_to :notify_template
  
  # validates :notify_observer_property_id, :presence => true
end
