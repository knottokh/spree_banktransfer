class AddIndexOnActiveOnSpreeBank < ActiveRecord::Migration[4.2]
  def change
    add_index :spree_banks, :active
  end
end
