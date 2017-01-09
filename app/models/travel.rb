class Travel < ApplicationRecord
  acts_as_taggable
  mount_uploader :facade, FacadeUploader
    validates :title, length: {in: 4..40}, uniqueness: {case_sensitive: false}
    validates :content, length: {in: 150..7000}
    validates :tag_list, length: {minimum: 1, message: 'Debe haber al menos una etiqueta'}

    belongs_to :user

    scope :most_recent, -> { order(published_at: :desc) }
    scope :published, -> { where(published: true) }

    def publish
      update(published: true, published_at: Time.now)
    end

    def hide
      update(published: false, published_at: nil)
    end
end
