#require 'dynamic_table'
class List < ActiveRecord::Base
  include DynamicTable
  has_many :list_items
  attr_accessible :extra_data, :name, :type
end
