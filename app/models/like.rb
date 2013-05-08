class Like < ActiveRecord::Base
  attr_accessible :created_at, :pin_id, :updated_at, :user_id
  
  belongs_to :user
  belongs_to :pin
end
