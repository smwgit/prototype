class Message < ActiveRecord::Base
  attr_accessible :content
  
  default_scope :order => 'message.created_at DESC'
end
