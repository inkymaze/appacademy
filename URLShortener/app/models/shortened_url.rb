class ShortenedUrl < ApplicationRecord
  validates :short_url, uniqueness: true, presence: true
  validates :long_url, uniqueness: true, presence: true

  def self.random_code
    code = SecureRandom::urlsafe_base64[0..7]
    while ShortenedUrl.exists?(short_url: code)
      code = SecureRandom::urlsafe_base64[0..7]
    end
    code
  end

  def self.generate_url(user, long_url)
    ShortenedUrl.create(long_url: long_url, submitter_id: user.id,
      short_url: ShortenedUrl.random_code)
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  has_many :taggings,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Tagging

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topics

  def num_clicks
    visits.length
  end

  def num_uniques
    visitors.length
  end

  def num_recent_uniques
    # visitors.select(:created_at > 1.days.ago).length
  end
end
