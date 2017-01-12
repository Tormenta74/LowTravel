class Travel < ApplicationRecord
  acts_as_taggable
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  mount_uploader :facade, FacadeUploader
    validates :title, length: {in: 4..40}, uniqueness: {case_sensitive: false}
    validates :content, length: {in: 150..7000}
    validates :facade, file_size: { less_than: 5.megabytes }
    validates :tag_list, length: {minimum: 1, message: 'Debe haber al menos una etiqueta'}

    belongs_to :user

    scope :most_recent, -> { order(published_at: :desc) }
    scope :published, -> { where(published: true) }
    scope :with_title, ->(title) {
      where("travels.title LIKE ?","%#{title}")
    }
    scope :by_year_and_month, ->(year, month) {
      date = Date.new(year,month)
      where(published_at: date..date.next_month)
    }
    scope :by_months_ago, ->(months) {
      where(published_at: months.month.ago.beginning_of_month..months.month.ago.end_of_month)
    }

    default_scope { where(published: true) and order(published_at: :desc) }

    def publish
      update(published: true, published_at: Time.now)
    end

    def hide
      update(published: false, published_at: nil)
    end
end
