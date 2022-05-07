# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "sample@sample",
    password: "password"
)

Genre.create!(
 [
  { 
    id: 1,
    name: "ケーキ"
  },
  { 
    id: 2,
    name: "プリン"
  }
 ]
)

Item.create!(
    genre_id: 1,
    name: "いちごのショートケーキ(ホール)",
    caption: "栃木県産のとちおとめを贅沢に使用しています。",
    price: 2500,
    is_sold: true
)

item = Item.create!(
    genre_id: 2,
    name: "カスタードプリン",
    caption: "カスタードを使用したプリンです。",
    price: 300,
    is_sold: false
)

item.image.attach(io: File.open(Rails.root.join('app/assets/images/sample01.jpg')),
                  filename: 'sample01.jpg')