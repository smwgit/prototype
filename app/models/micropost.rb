# == Schema Information
# Schema version: 20101110201535
#
# Table name: microposts
#
#  id         :integer         primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :timestamp
#  updated_at :timestamp
#

class Micropost < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'
end
