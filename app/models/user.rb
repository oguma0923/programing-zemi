class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  # メアドを小文字に
  before_save {email.downcase!}
  # nameは必ず存在し、長さ50字以内
  validates :name, presence: true, length: {maximum: 50}
  # メールアドレスのフォーマットを正規表現で指定
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # emailは必ず存在、長さ255字以内
  # メールアドレスのフォーマットを満たす
  # メールアドレスはunique
  validates :email, presence: true, length: {maximum: 255},
              format: {with:VALID_EMAIL_REGEX},
              uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
end 
