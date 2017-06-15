# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
ShortenedUrl.destroy_all
TagTopic.destroy_all
Tagging.destroy_all

User.create(email: "John@gmail.com")
User.create(email: "Joe@yahoo.com")
User.create(email: "Jane@yahoo.com")
User.create(email: "Bob@hotmail.com")
User.create(email: "John@yahoo.com")

ShortenedUrl.generate_url(User.first, "www.google.com")
ShortenedUrl.generate_url(User.last, "www.yahoo.com")
ShortenedUrl.generate_url(User.third, "www.github.com")
ShortenedUrl.generate_url(User.second, "www.stackoverflow.com")

TagTopic.create(topic: "sports")
TagTopic.create(topic: "search")
TagTopic.create(topic: "politics")
TagTopic.create(topic: "news")
TagTopic.create(topic: "help")


Tagging.create(shortened_url_id: ShortenedUrl.first.id, topic_id: TagTopic.second.id)
Tagging.create(shortened_url_id: ShortenedUrl.first.id, topic_id: TagTopic.last.id)
Tagging.create(shortened_url_id: ShortenedUrl.second.id, topic_id: TagTopic.first.id)
Tagging.create(shortened_url_id: ShortenedUrl.last.id, topic_id: TagTopic.last.id)
