# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


# create a Shopping List constraint
@c_shopping_list = Constraint.create!(
  :name=>"Grocery List, minimal",              # the displayed name of the item
  :class=>"grocery_list",                       # the class name for this object type
  :contains=>["groceries","grocery_lists"],     # what objects we can have as children of this list
  :data_options=>{                              # the actual constraints for the type.
    :budget=>{
      :type=>'currency'
    },
    :max_items=>{
      :type=>'integer'
    },
    :completed=>{
      :type=>'boolean'
    }
  }
)
# create a Shopping List Item constraint
@c_shopping_list_item = Constraint.create!(
  :name=>"Grocery List Item",              # the displayed name of the item
  :class=>"grocery",                       # the class name for this object type
  :data_options=>{                              # the actual constraints for the type.
    :name=>{
      :type=>'string'
    },
    :price=>{
      :type=>'currency'
    },
    :count=>{
      :type=>'integer'
    },
    :bought=>{
      :type=>'integer'
    },
    :completed=>{
      :type=>'boolean'
    },
    :is_on_sale=>{
      :type=>'boolean'
    },
    :price_on_sale=>{
      :type=>'currency'
    }
  }
)


# creates a Reading List that has a pointer in the list 
# to a child object, as well as a pointer to a parent object.
# The parent object can be any valid object.
@book_list = Constraint.create!(
  :name=>"Reading List",
  :class=>"reading_list",
  :contains=>["books","reading_lists"],
    :parent=>{
      :type=>'object',
      :constraint=>'Reading List'
    },
    :author=>{
      :type=>'string'
    },
    :current_book=>{
      :type=>'child'
    }
)


list = List.create!(
  :name=>"Shopping List",
  :type=>"shopping",
  :constraint=>@c_shopping_list,
  :extra_data=>{
    :budget=>100.00,
    :max_items=>3,
    :completed=>false
  }
=begin
  ,
  :list_items=>[
    ListItem.create!(
      :name=>"Eggs",
      :price=>4.56,
      :quantity=>18,
      :units=>"count",
      :comment=>"Eggs for Crepes"
    ),
    ListItem.create!(
      :name=>"Milk",
      :price=>5.00,
      :quantity=>1,
      :units=>"count",
      :comment=>"Milk for Crepes"
    ),
    ListItem.create!(
      :name=>"Bacon",
      :price=>4.00,
      :quantity=>2,
      :units=>"lb",
      :comment=>"for ME!"
    ),
    ListItem.create!(
      :name=>"Donuts",
      :price=>6.00,
      :quantity=>1,
      :units=>"dozen",
      :comment=>"MmMmMmMmmm... Donuts"
    )
  ]
=end
)

list = List.create!(
  :name=>"Book List",
  :type=>"book",
  :extra_data=>{
    :budget=>100.00,
    :max_items=>3,
    :completed=>false
  }
=begin ,
  :list_items=>[
    ListItem.create!(
      :name=>"The Survey of Cornwall",
      :author=>"Richard Carew",
      :date_published=>"2006/02/01",
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    ),
    ListItem.create!(
      :name=>"Pride and Prejudice",
      :author=>"Jane Austen",
      :year_published=>"1998/06/01",
      :price=>12.90,
      :quantity=>3,
      :comment=>"Gutenberg Top 100, #2"
    ),
    ListItem.create!(
      :name=>"The Adventures of Sherlock Holmes by Sir Arthur Conan Doyle (1239)",
      :author=>"Richard Carew",
      :year_published=>1366,
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    ),
    ListItem.create!(
      :name=>"Magic and Witchcraft by Anonymous (1061)",
      :author=>"Richard Carew",
      :year_published=>1366,
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    ),
    ListItem.create!(
      :name=>"Alice's Adventures in Wonderland by  (828)",
      :author=>"Lewis Carroll",
      :year_published=>1366,
      :price=>19.99,
      :quantity=>1,
      :comment=>"Gutenberg Top 100, #1"
    )
  ]
=end
)
