class AddAttachmentImageToBank < ActiveRecord::Migration[4.2]
   def self.up
    change_table :spree_banks do |t|
      t.attachment :bank_attachment
    end
    change_table :spree_payments do |t|
      t.attachment :bank_attachment
    end
  end

  def self.down
    remove_attachment :spree_banks, :bank_attachment
    remove_attachment :spree_payments, :bank_attachment
  end
    #remove_column :spree_banks, :name
    #remove_column :spree_banks, :account_no
    #remove_column :spree_banks, :additional_details
    ##remove_column :spree_banks, :active
    
    ##remove_index "spree_banks", name: "index_spree_banks_on_active"
    #remove_index "spree_banks", name: "index_spree_banks_on_name_and_account_no"
    
    #remove_column :spree_payments, :bank_name
    #remove_column :spree_payments, :account_no
    #remove_column :spree_payments, :transaction_reference_no
    #remove_column :spree_payments, :deposited_on

end