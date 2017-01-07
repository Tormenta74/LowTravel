class Travel < ApplicationRecord
  validates :title, length: {in: 4..40}, uniqueness: {case_sensitive: false}
  validates :content, length: {in: 150..7000}

  belongs_to :user

  scope :most_recent, -> { order(published_at: :desc) }
end
