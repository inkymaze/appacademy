# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Response.destroy_all
Question.destroy_all
AnswerChoice.destroy_all

user1 = User.create(name: "Jon")
user2 = User.create(name: "Nick")

poll1 = Poll.create(title: "Jon's Poll", author_id: user1.id)

question1 = Question.create(text: "What's for lunch?", poll_id: poll1.id)
question2 = Question.create(text: "What's for dinner?", poll_id: poll1.id)

answer_choice1 = AnswerChoice.create(text: "mexican food", question_id: question1.id)
answer_choice2 = AnswerChoice.create(text: "indian food", question_id: question1.id)
answer_choice2 = AnswerChoice.create(text: "indian food", question_id: question2.id)


response1 = Response.create(answerchoice_id: answer_choice1.id, user_id: user1.id )
