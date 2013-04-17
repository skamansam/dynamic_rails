module DynamicTable
  extend ActiveSupport::Concern
  included do
    belongs_to :constraint,:polymorphic=>true
    validates_presence_of :constraint
    attr_accessible :extra_data
    serialize :extra_data, Hash
  end
  #self.table_name = self.class.name.pluralize.tableize
  
  def self.dynamic_where(key,value)
    where("extra_data LIKE '% {key}: #{value} %'")
  end
  def self.dynamic_find(key,value)
    dynamic_where.first
  end
  def method_missing(method_name, *args,&block)
    puts "Method Missing in #{self.class.name}: #{method_name}, #{args.inspect}"
    extra = read_attribute(:extra_data)
    puts "#{extra}"
    if extra.has_key?(method_name)
      write_attribute(extra_data,extra_data.merge(args)) if self.constraints.data_options.include?(symbol)
    else
      super
    end
    
  end
end
