class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged,:finders]
  #attr_accessor :slug

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, uniqueness: {case_sensitive: false}
  validates :slug, uniqueness: true
  #validates_date :dob, :before => lambda { 18.years.ago  },
      #:before_message => "must be at least 18 years old"

  has_many :travels

  def should_generate_new_friendly_id?
    new_record? || slug.nil? || slug.blank? # you can add more condition here
  end
end
