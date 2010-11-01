# == Schema Information
# Schema version: 20101008151015
#
# Table name: datasets
#
#  id         :integer         not null, primary key
#  celltype   :string(255)
#  factor     :string(255)
#  replicate  :string(255)
#  user       :string(255)
#  notes      :text
#  date       :date
#  barcode    :string(255)
#  other      :string(255)
#  sequencer  :string(255)
#  lanes      :decimal(, )
#  files      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Dataset < ActiveRecord::Base
  attr_accessible :jobid, :user_id, :person, :sample, :replicate, :cellType, :factor, :numReads, :mappedReads, :unmappedReads, :averageCPL, :medianCPL, :minCPL, :maxCPL, :aligner, :system, :alignParams, :refGenome, :files, :sequencer, :barcode, :dateDone, :dateRec, :lanes, :comments, :otherInfo, :sort
  
  belongs_to :user
  
  validates :jobid,   :presence => true,
                      :uniqueness => { :case_sensitive => false}
  validates :user_id, :presence => true
  
  default_scope :order => 'datasets.created_at DESC'
end
