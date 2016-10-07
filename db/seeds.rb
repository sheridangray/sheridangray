# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sheridan = User.create(first_name: "Sheridan", last_name: "Gray", email: "sheridan.gray@gmail.com", password: "openPass")

10.times do
  user = User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email, 
    password: "openPass")
end

styles = [
  ["Constant Professional", 
    "You wear a suit Monday through Friday, often find you are having dinner with clients, and even on the weekends dress well as you might run into colleagues and clients out on the town. Your image is tied closely to the reputation you have carefully crafted over the years — a man who pays attention to the details and can be trusted to handle others people’s affairs with professionalism.",
    1],
  ["Business Owner", 
    "You occasionally wear a suit when meeting with clients or investors but in the confines of your office you are more casual while still maintaining a level of professionalism around your employees. In the evenings with friends and family you are much more relaxed, and even if you head to the office Saturday morning, you’re going in jeans and a polo.",
    2],
  ["Uniform Man", 
    "You have a specific uniform you wear that is required by the nature of your work. The only time you need personal clothing is when you have time off in the evenings and your weekends. You wear a suit rarely, but when you do you like to look sharp as being a man of detail you pay attention to the small things.",
    3],
  ["Casual Creative", 
    "You work in an environment in which creativity is valued and conformity is dreaded. Although you have some colleagues that dress in the clothing they slept in, you realize that dressing up a notch does not mean you are losing yourself as an individual. Rather it gives you a chance to better express it without compromising your chance for opportunity.",
    4]
]
styles.each do |name, description, sort_order|
  Style.create(name: name, description: description, sort_order: sort_order)
end


clothing_type_categories = [
  [
    "Shirts", 
    "Default description.", 
    1, 
    [
      ["Dress Shirt", "Default description.", 9, "wardrobes/images/dress-shirt.jpeg", 12],
      ["Collared Shirt", "Default description.", 10, "wardrobes/images/button-up-collared-shirt.jpg", 9],
      ["Solid Polo", "Default description.", 11, "wardrobes/images/Solid Polo.png", 12],
      ["Sweater", "Default description.", 12, "wardrobes/images/Sweater.jpeg", 7]
    ]
  ],
  [
    "Pants / Shorts", 
    "Default description.", 
    2,
    [
      ["Jeans", "Default description.", 13, "wardrobes/images/Jeans.jpg", 36],
      ["Slacks", "Default description.", 14, "wardrobes/images/slacks.jpeg", 9]
    ]
  ],
  [
    "Footwear", 
    "Default description.", 
    3,
    [
      ["Dress Shoes", "Default description.", 2, "wardrobes/images/dress-shoes.jpeg", 20],
      ["Casual Leather Shoes", "Default description.", 15, "wardrobes/images/casual-leather-shoes.jpeg", 18]
    ]
  ],
  [
    "Outerwear", 
    "Default description.", 
    4,
    [
      ["Sport Jacket", "Default description.", 16, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Navy Blazer", "Default description.", 17, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Trenchcoat", "Default description.", 18, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Overcoat", "Default description.", 19, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Trendy Sports Jacket", "Default description.", 20, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Trendy Overcoat", "Default description.", 21, "wardrobes/images/dress-shirt.jpeg", 18]
    ]
  ],
  [
    "Belt", 
    "Default description.", 
    5,
    [
      ["Dress Belt", "Default description.", 3, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Casual Belt", "Default description.", 24, "wardrobes/images/dress-shirt.jpeg", 18]
    ]
  ],
  [
    "Watch", 
    "Default description.", 
    6,
    [
      ["Dress Watch", "Default description.", 6, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Simple Watch", "Default description.", 25, "wardrobes/images/dress-shirt.jpeg", 18]
    ]
  ],
  [
    "Undershirt", 
    "Default description.", 
    7,
    [
      ["V-Neck Undershirt", "Default description.", 26, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Crew Undershirt", "Default description.", 27, "wardrobes/images/dress-shirt.jpeg", 18]
    ]
  ],
  [
    "Athletic", 
    "Default description.", 
    8,
    [
      ["Presentable Athletic Clothing", "Default description.", 28, "wardrobes/images/dress-shirt.jpeg", 18]
    ]
  ],
  [
    "Formal", 
    "Default description.", 
    9,
    [
      ["Suit", "Default description.", 1, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Tie", "Default description.", 4, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Pocket Square", "Default description.", 5, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Leather Gloves", "Default description.", 7, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Hat", "Default description.", 8, "wardrobes/images/dress-shirt.jpeg", 18]
    ]
  ],
  ["Tux", 
    "Default description.", 
    10,
    [
      ["Vest", "Default description.", 22, "wardrobes/images/dress-shirt.jpeg", 18],
      ["Tuxedo", "Default description.", 23, "wardrobes/images/dress-shirt.jpeg", 18]
    ]
  ]
]
clothing_type_categories.each do |name, description, sort_order, items|
  clothing_type_category = ClothingTypeCategory.create(
    name: name, 
    description: description, 
    sort_order: sort_order
  )

  items.each do |item_name, item_description, item_sort_order, image_url, expected_months_to_expire|
    clothing_type = ClothingType.create(
      name: item_name, 
      description: item_description, 
      sort_order: item_sort_order, 
      clothing_type_category_id: clothing_type_category.id,
      image_url: image_url,
      expected_months_to_expire: expected_months_to_expire
    )
  end
end

ideal_styles = [
  ["Business Owner", "Collared Shirt", 5],
  ["Business Owner", "Casual Belt", 2],
  ["Business Owner", "Casual Leather Shoes", 2],
  ["Business Owner", "Dress Belt", 2],
  ["Business Owner", "Dress Shirt", 10],
  ["Business Owner", "Dress Shoes", 1],
  ["Business Owner", "Dress Watch", 1],
  ["Business Owner", "Hat", 1],
  ["Business Owner", "Jeans", 2],
  ["Business Owner", "Leather Gloves", 1],
  ["Business Owner", "Navy Blazer", 1],
  ["Business Owner", "Pocket Square", 5],
  ["Business Owner", "Presentable Athletic Clothing", 1],
  ["Business Owner", "Slacks", 5],
  ["Business Owner", "Solid Polo", 5],
  ["Business Owner", "Sport Jacket", 2],
  ["Business Owner", "Suit", 1],
  ["Business Owner", "Sweater", 5],
  ["Business Owner", "Tie", 3],
  ["Business Owner", "Trenchcoat", 1],
  ["Business Owner", "V-Neck Undershirt", 10],
  ["Constant Professional", "Collared Shirt", 4],
  ["Constant Professional", "Casual Belt", 2],
  ["Constant Professional", "Casual Leather Shoes", 2],
  ["Constant Professional", "Dress Belt", 3],
  ["Constant Professional", "Dress Shirt", 15],
  ["Constant Professional", "Dress Shoes", 3],
  ["Constant Professional", "Dress Watch", 2],
  ["Constant Professional", "Hat", 1],
  ["Constant Professional", "Jeans", 1],
  ["Constant Professional", "Leather Gloves", 1],
  ["Constant Professional", "Navy Blazer", 1],
  ["Constant Professional", "Pocket Square", 10],
  ["Constant Professional", "Presentable Athletic Clothing", 1],
  ["Constant Professional", "Slacks", 4],
  ["Constant Professional", "Solid Polo", 2],
  ["Constant Professional", "Sport Jacket", 2],
  ["Constant Professional", "Suit", 6],
  ["Constant Professional", "Sweater", 5],
  ["Constant Professional", "Tie", 15],
  ["Constant Professional", "Trenchcoat", 1],
  ["Constant Professional", "Tuxedo", 1],
  ["Constant Professional", "V-Neck Undershirt", 10],
  ["Casual Creative", "Collared Shirt", 6],
  ["Casual Creative", "Casual Belt", 2],
  ["Casual Creative", "Casual Leather Shoes", 2],
  ["Casual Creative", "Crew Undershirt", 10],
  ["Casual Creative", "Dress Belt", 1],
  ["Casual Creative", "Dress Shirt", 10],
  ["Casual Creative", "Dress Shoes", 1],
  ["Casual Creative", "Hat", 1],
  ["Casual Creative", "Jeans", 4],
  ["Casual Creative", "Leather Gloves", 1],
  ["Casual Creative", "Pocket Square", 5],
  ["Casual Creative", "Presentable Athletic Clothing", 1],
  ["Casual Creative", "Simple Watch", 1],
  ["Casual Creative", "Slacks", 2],
  ["Casual Creative", "Solid Polo", 2],
  ["Casual Creative", "Suit", 1],
  ["Casual Creative", "Sweater", 6],
  ["Casual Creative", "Tie", 2],
  ["Casual Creative", "Trendy Overcoat", 1],
  ["Casual Creative", "Trendy Sports Jacket", 1],
  ["Casual Creative", "Vest", 2],
  ["Uniform Man", "Collared Shirt", 2],
  ["Uniform Man", "Casual Belt", 1],
  ["Uniform Man", "Casual Leather Shoes", 1],
  ["Uniform Man", "Crew Undershirt", 5],
  ["Uniform Man", "Dress Belt", 1],
  ["Uniform Man", "Dress Shirt", 4],
  ["Uniform Man", "Dress Shoes", 1],
  ["Uniform Man", "Dress Watch", 1],
  ["Uniform Man", "Hat", 1],
  ["Uniform Man", "Jeans", 2],
  ["Uniform Man", "Navy Blazer", 1],
  ["Uniform Man", "Overcoat", 1],
  ["Uniform Man", "Pocket Square", 3],
  ["Uniform Man", "Presentable Athletic Clothing", 1],
  ["Uniform Man", "Slacks", 2],
  ["Uniform Man", "Solid Polo", 3],
  ["Uniform Man", "Sport Jacket", 1],
  ["Uniform Man", "Suit", 1],
  ["Uniform Man", "Sweater", 3],
  ["Uniform Man", "Tie", 3],
]

ideal_styles.each do |ideal_style|
  
  style = Style.find_by(name: ideal_style[0])
  clothing_type = ClothingType.find_by(name: ideal_style[1])

  ideal_wardrobe_item = IdealWardrobeItem.create(
    style_id: style.id,
    clothing_type_id: clothing_type.id,
    amount: ideal_style[2].to_s
  )
end