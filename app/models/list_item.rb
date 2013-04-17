require 'dynamic_table'
class ListItem  < ActiveRecord::Base
  include DynamicTable
  belongs_to :list
  attr_accessible :extra_data, :name, :type
end
