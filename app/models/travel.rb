class Travel < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :content, presence: true, length: { maximum: 7000 }

  belongs_to :user
end
