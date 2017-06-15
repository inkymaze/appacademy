class User < ApplicationRecord
  validates :name, uniquesness: true, presence: true 
  validates :id, uniqueness: true, presence: true

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Poll

    has_many :responses,
    primary_key: :id,
    foreign_key: :answerchoice_id,
    class_name: :Response


end
