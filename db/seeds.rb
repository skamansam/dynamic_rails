# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
list = List.create(
  :name=>"Shopping List",
  :type=>"shopping",
  :extra_data=>{
    :budget=>100.00,
    :max_items=>3,
    :completed=>false
  },
  :list_items=>[
    {
      :name=>"Eggs",
      :price=>4.56,
      :quantity=>18,
      :units=>"count",
      :comment=>"Eggs for Crepes"
    },{
      :name=>"Milk",
      :price=>5.00,
      :quantity=>1,
      :units=>"count",
      :comment=>"Milk for Crepes"
    },{
      :name=>"Bacon",
      :price=>4.00,
      :quantity=>2,
      :units=>"lb",
      :comment=>"for ME!"
    },{
      :name=>"Donuts",
      :price=>6.00,
      :quantity=>1,
      :units=>"dozen",
      :comment=>"MmMmMmMmmm... Donuts"
    }
  ]
)

list = List.create(
  :name=>"Book List",
  :type=>"book",
  :extra_data=>{
    :budget=>100.00,
    :max_items=>3,
    :completed=>false
  },
  :list_items=>[
    {
      :name=>"The Survey of Cornwall",
      :author=>"Richard Carew",
      :date_published=>"2006/02/01",
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    },{
      :name=>"Pride and Prejudice",
      :author=>"Jane Austen",
      :year_published=>"1998/06/01",
      :price=>12.90,
      :quantity=>3,
      :comment=>"Gutenberg Top 100, #2"
    },{
      :name=>"The Adventures of Sherlock Holmes by Sir Arthur Conan Doyle (1239)",
      :author=>"Richard Carew",
      :year_published=>1366,
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    },{
      :name=>"Magic and Witchcraft by Anonymous (1061)",
      :author=>"Richard Carew",
      :year_published=>1366,
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    },{
      :name=>"Alice's Adventures in Wonderland by  (828)",
      :author=>"Lewis Carroll",
      :year_published=>1366,
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    }
  ]
)
