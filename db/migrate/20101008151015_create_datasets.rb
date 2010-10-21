class CreateDatasets < ActiveRecord::Migration
  def self.up
    create_table :datasets do |t|
      t.integer :user_id
      t.string :person
      t.string :sample
      t.string :replicate
      
      t.string :cellType
      t.string :factor
      
      t.integer :numReads
      t.integer :mappedReads
      t.integer :unmappedReads
      t.decimal :averageCPL
      t.decimal :medianCPL
      t.decimal :minCPL
      t.decimal :maxCPL
      
      t.string :aligner
      t.string :system
      t.string :alignParams
      t.string :refGenome
      t.text :files
      
      t.string :sequencer
      t.string :jobid
      t.string :barcode
      t.date :dateDone
      t.date :dateRec
      t.decimal :lanes
      
      t.text :comments
      t.string :otherInfo
      
      t.timestamps
      
      
      
      #t.string :celltype
      #t.string :factor
      #t.string :replicate
      #t.string :user_id
      #t.text :notes
      #t.dateDone :dateD
      #t.dateRec :dateR
      #t.string :jobid
      #t.string :barcode
      #t.string :other
      #t.string :sequencer
      #t.decimal :lanes
      #t.text :files
      #t.text :program
      #
      #t.timestamps
    end
    add_index :datasets, :user_id
  end

  def self.down
    drop_table :datasets
  end
end
