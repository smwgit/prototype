# == Schema Information
# Schema version: 20101110205939
#
# Table name: datasets
#
#  id            :integer         not null, primary key
#  jobid         :string(255)
#  user_id       :integer
#  person        :string(255)
#  conditions    :string(255)
#  replicate     :string(255)
#  cellType      :string(255)
#  factor        :string(255)
#  numReads      :decimal(, )
#  mappedReads   :decimal(, )
#  unmappedReads :decimal(, )
#  averageCPL    :decimal(, )
#  medianCPL     :decimal(, )
#  minCPL        :decimal(, )
#  maxCPL        :decimal(, )
#  aligner       :string(255)
#  system        :string(255)
#  alignParams   :string(255)
#  refGenome     :string(255)
#  files         :text
#  filesURL      :text
#  sequencer     :string(255)
#  barcode       :string(255)
#  dateDone      :date
#  dateRec       :date
#  lanes         :decimal(, )
#  comments      :text
#  otherInfo     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Dataset < ActiveRecord::Base
  attr_accessible :jobid, :user_id, :person, :conditions, :replicate, :cellType, :factor, :numReads, :mappedReads, :unmappedReads, :averageCPL, :medianCPL, :minCPL, :maxCPL, :aligner, :system, :alignParams, :refGenome, :files, :sequencer, :barcode, :dateDone, :dateRec, :lanes, :comments, :otherInfo, :filesURL
  
  belongs_to :user
  
  validates :jobid,   :presence => true,
                      :uniqueness => { :case_sensitive => false}
  validates :user_id, :presence => true
  
  #default_scope :order => 'datasets.jobid DESC'
  
  def self.search(search)
    if search
      find(:all, :conditions => ['comments LIKE ?', "%#{search}%"])
    else
      find(:all)
    end    
  end
end
