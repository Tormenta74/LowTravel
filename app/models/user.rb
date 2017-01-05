class User < ApplicationRecord
    validates :name, uniqueness: true
    validates :email, uniqueness: {case_sensitive: false}, length: { minimum: 6 }, format: {multiline: true, with: /\A\S+@.+\.\S+\z/, message: 'Invalid email format'}
end
