# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Artwork.destroy_all 



10.times do 
    User.create(
        name: Faker::Name.name,
        photo: "https://www.seekpng.com/png/detail/41-410093_circled-user-icon-user-profile-icon-png.png"
    )
    
end 

Bob = User.create(name:"Bob", photo:"https://tse2.mm.bing.net/th?id=OIP.eBc4gWi6rdVMlAKasQFp-gHaHa&pid=Api&P=0&w=300&h=300")

10.times do 
    Artwork.create(
        title: Faker::Games::Heroes.artifact,
        image:"http://2.bp.blogspot.com/-n5OW6VhZLVw/UoJdrLpo2BI/AAAAAAAAAOs/AP5G3_CW0tE/s1600/van-gogh-vincent-starry-night.jpg"
    )
    
end

Bobs_artwork = Artwork.create(title: "masterpiece", image: "https://tse4.mm.bing.net/th?id=OIP._9DUU7JCZ3bFcTwsTGAM5gHaE8&pid=Api&P=0&w=321&h=215")


UserArtwork.create(user:Bob, artwork:Bobs_artwork)