class Poll < ApplicationRecord
  validates :id, uniqueness: true, presence: true
  validates :title, presence: true 

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :questions,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Question

end
