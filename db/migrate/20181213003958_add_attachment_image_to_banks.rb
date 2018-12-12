class AddAttachmentImageToBank < ActiveRecord::Migration[4.2]
  def change
    change_table :spree_banks do |t|
      t.attachment :image
    end
    add_column :spree_payments, :bank_attachment, :image
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
end