class Reply < ApplicationRecord
  validates :user_id,{presence:true}
  validates :post_id,{presence:true}
  validates :content,{presence:true}
end
