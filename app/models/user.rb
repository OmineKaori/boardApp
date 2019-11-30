class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true} #ちゃんとemailの形式になっているかあとで実装
  validates :password, {presence: true}
end
