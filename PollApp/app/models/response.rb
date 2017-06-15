class Response < ApplicationRecord
  validates :id, uniqueness: true, presence: true
  validates :user_id, presence: true
  validates :answerchoice_id, presence: true

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answerchoice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses
  end
end
