class Constraint < ActiveRecord::Base
  attr_accessible :data_options, :for_type, :input_options, :name
  serialize :data_options, Array  # this is really a dict
  serialize :input_options, Hash
end
