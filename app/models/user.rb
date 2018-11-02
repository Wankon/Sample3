class User < ApplicationRecord
    validates :name, presence: true
    validates :name, length: { maximum: 15 } #課題4
    validates :email, presence: true
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } #課題3
    validates :password, length: { in: 8..32 } #課題1
    validates :password, format: { with: /\A[a-zA-Z\d]+\z/ } #課題2

    has_secure_password

    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
end
