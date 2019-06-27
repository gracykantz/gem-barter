puts "Deleting all previous seeds"
Image.destroy_all
Swipe.destroy_all
Match.destroy_all
ChatRoom.destroy_all
Message.destroy_all
FurnitureItem.destroy_all
User.destroy_all
Category.destroy_all
puts "Done deleting"

all = Category.create!(
  name:"View All",
  remote_photo_url: "https://i.pinimg.com/originals/af/58/3f/af583fa3480d39b05cbbf6ab1748aaca.jpg"
  )

livingroom = Category.create!(
  name: "Living Room",
  remote_photo_url: "https://d28m5bx785ox17.cloudfront.net/v1/img/q2tWxNRTC-Z32gPGoUdKLQAQfHkQ6eUS-VQdnc27L4c=/d/l"
  )

bedroom = Category.create!(
  name: "Bedroom",
  remote_photo_url: "https://cdn.shopify.com/s/files/1/2660/5202/products/lmduwx5xwv1vic7nhg05_1400x.jpg?v=1536591621"
  )

kitchen = Category.create!(
  name: "Kitchen",
  remote_photo_url: "https://i.imgur.com/fzsfTi6.jpg"
  )

office = Category.create!(
  name: "Office",
  remote_photo_url: "https://images.furnituredealer.net/img/dealer/1391/upload/category/home_office_-_ashl_h633-27-02a-70-r40115.jpg"
  )

pets = Category.create!(
  name: "Pet Accessories",
  remote_photo_url: "https://askgramps.org/files/2016/08/pets1.jpg"
  )

outdoor = Category.create!(
  name: "Outdoor",
  remote_photo_url: "https://stylecurator.com.au/wp-content/uploads/2018/02/IKEA-outdoor-living.jpg"
  )
oscar = User.create!(
    first_name: "Oscar",
    last_name: "Nilestam",
    email: "oscar@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/17hXBzb.jpg",
    bio: "I really like chicken wings",
    remote_photo_url: "https://i.imgur.com/17hXBzb.jpg",
    location: "Laröd, Helsingborg",
    average_rating: 1
    )

furniture_item = oscar.furniture_items.create!(
  title: "Spray bottle",
  description: "You can use this spray bottle for so many different things. Spray your plants with water, put cleaning supplies in it.",
  category_id: outdoor.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/NViw3uI.jpg")

gracy = User.create!(
    first_name: "Gracy",
    last_name: "Kantzabedian",
    email: "gracy@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/KXSQEfC.jpg",
    bio: "Lover of planet and people, cat owner, and always looking to renew and refresh the style of my home.",
    remote_photo_url: "https://i.imgur.com/KXSQEfC.jpg",
    location: "Rosengarden, Helsingborg",
    average_rating: 5
    )

furniture_item = gracy.furniture_items.create!(
  title: "Large white cat tree",
  description: "White cat tree that my cat no longer has interest in.",
  category_id: pets.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/Jubpvuu.jpg")


mika = User.create!(
    first_name: "Mika ",
    last_name: "Bettanin",
    email: "mika@gmail.com",
    password: "123456",
    avatar_url: "https://education.fsu.edu/wp-content/uploads/2016/09/staff-avatar-man.png",
    bio: "Love refreshing my place, and meeting new people",
    remote_photo_url: "https://education.fsu.edu/wp-content/uploads/2016/09/staff-avatar-man.png",
    location: "Sockengatan, Helsingborg",
    average_rating: 4
    )

furniture_item = mika.furniture_items.create!(
  title: "Large gray cat tree",
  description: "This cat tree is too big for my apartment and really overpowers the room. I'm looking for something smaller.",
  category_id: pets.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/z2NQlXe.jpg")
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/iAgrRLG.jpg")


edwin = User.create!(
    first_name: "Edwin",
    last_name: "Mukelyan",
    email: "edwin@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/ZKcBGtA.jpg",
    bio: "Into antique furniture with a long history.",
    remote_photo_url: "https://i.imgur.com/ZKcBGtA.jpg",
    location: "Kullagatan, Helsingborg",
    average_rating: 3
    )

furniture_item = edwin.furniture_items.create!(
  title: "Window hanging cat bed",
  description: "This cat bed is perfect for your cat! I have moved into a new apartment and no longer need this because my apartment doesn't have windows.",
  category_id: pets.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/xMewNQS.jpg")
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/J39svLj.jpg")
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/c0Ftq1O.jpg")


rose = User.create!(
    first_name: "Rose",
    last_name: "Morgans",
    email: "rose@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/Sliu9Co.jpg",
    bio: "I have a beautiful daughter, and another one on the way. Looking for great finds for my kids!",
    remote_photo_url: "https://i.imgur.com/Sliu9Co.jpg",
    location: "Kullagatan, Helsingborg",
    average_rating: 5
    )

furniture_item = rose.furniture_items.create!(
  title: "Vittsjö White Glass Coffee Table",
  description: "Purchased this wonderful coffee table from IKEA, but no longer want it with the new baby on the way glass seems dangerous.",
  category_id: livingroom.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/xE8TdVH.jpg")
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/ZHge72V.jpg")

 shalini = User.create!(
    first_name: "Shalini",
    last_name: "Verma",
    email: "shalini@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/gheZcFH.jpg",
    bio: "Reliable and looking to trade!",
    remote_photo_url: "https://i.imgur.com/gheZcFH.jpg",
    location: "Kullagatan, Helsingborg",
    average_rating: 4
    )

furniture_item = shalini.furniture_items.create!(
  title: "Eclectic Bird Plate",
  description: "Beautiful blue plate with two lovebirds",
  category_id: kitchen.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/kx8Aow1.jpg")


josh = User.create!(
    first_name: "Joshua",
    last_name: "Cassista",
    email: "josh@gmail.com",
    password: "123456",
    avatar_url: "https://education.fsu.edu/wp-content/uploads/2016/09/staff-avatar-man.png",
    bio: "Happy father of two",
    remote_photo_url: "https://education.fsu.edu/wp-content/uploads/2016/09/staff-avatar-man.png",
    location: "Lund",
    average_rating: 4
    )

furniture_item = josh.furniture_items.create!(
  title: "Green cutting board",
  description: "Cutting board from IKEA, used quite a bit, but bought a new one and no longer need this one.",
  category_id: kitchen.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/b7CiTsZ.jpg")


ludvig = User.create!(
    first_name: "Ludvig",
    last_name: "Londos",
    email: "ludvig@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/uUgORdr.jpg",
    bio: "I like Magic the Gathering, and disappointing my friends.",
    remote_photo_url: "https://i.imgur.com/uUgORdr.jpg",
    location: "Helsingborg Central, Helsingborg",
    average_rating: 2
    )

furniture_item = ludvig.furniture_items.create!(
  title: "Ajax Glass Cleaner",
  description: "Bought too many bottles of Ajax and not in need of keeping this one.",
  category_id: kitchen.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/yqGZM9v.jpg")


alyssa = User.create!(
    first_name: "Alyssa",
    last_name: "Kantzabedian",
    email: "alyssa@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/NBQC65H.jpg",
    bio: "",
    remote_photo_url: "https://i.imgur.com/NBQC65H.jpg",
    location: "Hyllie Boulevard 19, Malmö",
    average_rating: 5
    )

furniture_item = alyssa.furniture_items.create!(
  title: "Coffee Table with Storage",
  description: "Beautiful wooden coffee table with storage which makes it perfect for storing your blankets.",
  category_id: livingroom.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/dx9GKsW.jpg")


lucy = User.create!(
    first_name: "Lucy",
    last_name: "Gezalian",
    email: "lucy@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/M7LmDwb.jpg",
    bio: "Lover of cats and girls and I like to collect weird interesting pieces for my place, added bonus if it is anything mythology related",
    remote_photo_url: "https://i.imgur.com/M7LmDwb.jpg",
    location: "Mariagatan 6, Helsingborg",
    average_rating: 4
    )

furniture_item = lucy.furniture_items.create!(
  title: "Friheten Gray Sofabed",
  description: "Sofabed from IKEA called Friheten, missing pull out part.. my cat decided it was a scratching post.",
  category_id: livingroom.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/oaPrdXp.jpg")
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/MVEcIP5.jpg")


dom = User.create!(
    first_name: "Dominicke",
    last_name: "Kim",
    email: "dom@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/Jd7TWTo.jpg",
    bio: "",
    remote_photo_url: "https://i.imgur.com/Jd7TWTo.jpg",
    location: "Stortorget 18, Helsingborg",
    average_rating: nil
    )

furniture_item = dom.furniture_items.create!(
  title: "Cute blue elephant watering can",
  description: "I realized I don't have a green thumb so I am trading my adorable little elephant watering can for something different, and not plant-related!",
  category_id: outdoor.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/GQxjJhd.jpg")


magda = User.create!(
    first_name: "Magda",
    last_name: "Kochanowicz",
    email: "magda@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/WHU7PWg.jpg",
    bio: "Happy mother of two amazing girls, working on living sustainably so they can have a better planet to live on.",
    remote_photo_url: "https://i.imgur.com/WHU7PWg.jpg",
    location: "Järnvägsgatan 13, Helsingborg",
    average_rating: 3
    )

furniture_item = magda.furniture_items.create!(
  title: "Cute Decorative Plates",
  description: "I have these adorable plates that my girls have grown out of, and want to change them out for something new!",
  category_id: kitchen.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/TRu0l2G.jpg")



drazen = User.create!(
    first_name: "Drazen",
    last_name: "Vukovic",
    email: "drazen@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/pe3OuGV.jpg",
    bio: "",
    remote_photo_url: "https://i.imgur.com/pe3OuGV.jpg",
    location: "Sofierovägen 131, Helsingborg",
    average_rating: 5
    )

furniture_item = drazen.furniture_items.create!(
  title: "Water Bottle",
  description: "This black water bottle keeps cold drinks cold and warm drinks warm. It's really convenient.",
  category_id: kitchen.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/nkEosFe.jpg")




jane = User.create!(
    first_name: "Jane",
    last_name: "Tilly",
    email: "jane@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/23fEv78.jpg",
    bio: "Redecorating my summer house and looking for antique items",
    remote_photo_url: "https://i.imgur.com/23fEv78.jpg",
    location: "GUSTAV ADOLFS TORG 8, Helsingborg",
    average_rating: 4
    )

furniture_item = jane.furniture_items.create!(
  title: "Modern Desk",
  description: "This modern black desk is perfect for any home.",
  category_id: office.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/DrZldeM.jpg")


olga = User.create!(
    first_name: "Olga",
    last_name: "Samunova",
    email: "olga@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/mm0WqBN.jpg",
    bio: "Love to travel and explore new places, and collect things from interesting areas.",
    remote_photo_url: "https://i.imgur.com/mm0WqBN.jpg",
    location: "Bollbrogatan 1, Helsingborg",
    average_rating: 5
    )

furniture_item = olga.furniture_items.create!(
  title: "Photo Frame",
  description: "Photo frame that fits three pictures. The outside of it is birch the matting is white.",
  category_id: livingroom.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/e4HQuC5.jpg")


laura = User.create!(
    first_name: "Laura",
    last_name: "Dai",
    email: "laura@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/pPar5l2.jpg",
    bio: "",
    remote_photo_url: "https://i.imgur.com/pPar5l2.jpg",
    location: "Råå, Helsingborg",
    average_rating: 1
    )

furniture_item = laura.furniture_items.create!(
  title: "Outdoor Table",
  description: "This small outdoor table is perfect for any apartment balcony.",
  category_id: outdoor.id
  )
  photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "https://i.imgur.com/Uuwdk0D.jpg")


carey = User.create!(
    first_name: "Carey",
    last_name: "Hinton",
    email: "carey@gmail.com",
    password: "123456",
    avatar_url: "https://i.imgur.com/uwcCXUO.jpg",
    bio: "Cat mom and avid gamer, looking for cool things for my office.",
    remote_photo_url: "https://i.imgur.com/uwcCXUO.jpg",
    location: "Helsingborg",
    average_rating: 4
    )

# chat_room = ChatRoom.create!(name: "general")

# message_1 = Message.create!(
#   content: "Hello",
#   chat_room: chat_room,
#   user: shalini
# )
# message_2 = Message.create!(
#   content: "Hey",
#   chat_room: chat_room,
#   user: gracy
# )
# message_3 = Message.create!(
#   content: "Yo",
#   chat_room: chat_room,
#   user: shalini
# )

# furniture_item = carey.furniture_items.create!(
#   title: "",
#   description: "",
#   category_id: kitchen
#   )
#   photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "")


# natalie= User.create!(
#     first_name: "Natalie",
#     last_name: "Carrasco",
#     email: "natalie@gmail.com",
#     password: "123456",
#     bio: "Love everything horror! Looking for more things to add to my collection.",
#     remote_photo_url: "https://i.imgur.com/2qc9inJ.jpg",
#   #  average_rating: 0
#     )

# furniture_item = natalie.furniture_items.create!(
#   title: "",
#   description: "",
#   category_id: outdoor
#   )
#   photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "")


# anne = User.create!(
#     first_name: "Anne",
#     last_name: "Hoffman",
#     email: "anne@gmail.com",
#     password: "123456",
#     bio: "",
#     remote_photo_url: "",
#   #  average_rating: 0
#     )

# furniture_item = anne.furniture_items.create!(
#   title: "",
#   description: "",
#   category_id: livingroom
#   )
#   photo = Image.create!(furniture_item: furniture_item, remote_photo_url: "")

puts "Seed file finished"
