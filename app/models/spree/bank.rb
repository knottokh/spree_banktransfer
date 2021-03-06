module Spree
  class Bank < ActiveRecord::Base
    has_attached_file :bank_attachment
    
    validates_attachment_content_type :bank_attachment, content_type: /\Aimage\/.*\z/
    #validates :name, :account_no , presence: true
    #validates_uniqueness_of :account_no , scope: :name

    scope :active, -> { where(active: true) }
  end
end