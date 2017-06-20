# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(email: "foo@bar.com", name: "FOOBEAR")
user2 = User.create(email: "john@bar.com", name: "John")
user3 = User.create(email: "dan@bar.com", name: "Daniel")
user4 = User.create(email: "nick@gmail.com", name: "Nick")

art1 = Artwork.create(title: "Self Portrait", image_url: "art.com/self",artist_id: user2.id)
art2 = Artwork.create(title: "Self Portrait", image_url: "art.com/bear",artist_id: user1.id)
art3 = Artwork.create(title: "My first Art", image_url: "art.com/myfirst",artist_id: user2.id)
art4 = Artwork.create(title: "Nick Art", image_url: "art.com/nick",artist_id: user4.id)


ArtworkShare.create(artwork_id: art1.id, viewer_id: user3.id)
ArtworkShare.create(artwork_id: art1.id, viewer_id: user1.id)
ArtworkShare.create(artwork_id: art2.id, viewer_id: user3.id)
ArtworkShare.create(artwork_id: art3.id, viewer_id: user4.id)
