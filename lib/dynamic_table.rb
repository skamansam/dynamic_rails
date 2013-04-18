module DynamicTable
  extend ActiveSupport::Concern
  included do
    belongs_to :constraint,:polymorphic=>true
    validates_presence_of :constraint
    attr_accessible :extra_data,:constraint
    serialize :extra_data, Hash
    validate :extra_data, :validate_extra_data
  end
  #self.table_name = self.class.name.pluralize.tableize
  
  def self.dynamic_where(key,value)
    where("extra_data LIKE '% {key}: #{value} %'")
  end
  def self.dynamic_find(key,value)
    dynamic_where(key,value).first
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
  
  def check_type_boolean(obj)
    return true if obj.is_a?(TrueClass)
    if obj.is_a?(String)
      ['true','t','f','false'].include?(obj.downcase)
    else
      [true,false,:true,:false,:t,:f,:T,:F].include?(obj)
    end
  end

  def check_type_string(obj)
    obj.is_a?(String) && obj.size <= 255
  end
  
  def check_type_text(obj)
    return true if obj.is_a?(String)
  end
  
  def check_type_integer(obj)
    obj.is_a?(Integer) || obj.to_i.is_a?(Integer)
  end

  def check_type_float(obj)
    return true if obj.is_a?(Float)
  end

  def check_type_currency(obj)
    check_type_float(obj)
  end
  
  def validate_extra_data
    #valid_keys = constraint.data_options.map{|o| (o.is_a?(Hash) ? o.keys : o)}.flatten
    valid_options = constraint.data_options
    self.extra_data.each do |key,value|
      if !valid_options.keys.include?(key)
        errors.add key.to_sym, "Dynamic key #{key} is invalid!"
        return false
      end
      type = valid_options[key][:type]
      if !respond_to?("check_type_#{type}".to_sym)
        errors.add "check_type_#{type}".to_sym, "Sorry! Validation does not exist for dynamic option #{key}.Please add check_type_#{type}() method to #{__FILE__}"
        return false
      end
      self.send "check_type_#{type}".to_sym,value
    end
  end

  def respond_to?(name, *args)
    extra_data.has_key?(name)|| constraint.data_options.has_key?(name.to_sym) || super(name, *args)
  end

end
