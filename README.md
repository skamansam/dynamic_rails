dynamic_rails
=============

Example rails app for db-agnostic "dynamic" data storage

This is for http://stackoverflow.com/questions/8102702/dynamically-creating-new-active-record-models-and-database-tables

Response: 
I can see a few use cases where one would like dynamic fields. I have worked and created a few applications with "dynamic" tables. They are not dynamic, but rely on Rails' ability to serialize data into a database field. First, I create two tables:

 1. A "dynamic_options" table that represents the constraints on the "dynamic" table, like what fields are valid, as well as other information I may need on each table
 2. A "dynamic_values" table, which has at least two fields: db_type, and dynamic_values, with  `serialize :dynamic_values, Hash` set in the model. To search for a specific value, use something like:
    def self.search_for(type,key,value)
      db = self.where("db_type IS #{type} AND dynamic_values IS LIKE '%#{key}: #{value}%'")
    end
See http://api.rubyonrails.org/classes/ActiveRecord/Base.html#M001799 for more on serialize().
I created a Rails app for this at https://github.com/skamansam/dynamic_rails
