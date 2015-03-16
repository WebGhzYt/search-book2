class AddIssuerIdToBook < ActiveRecord::Migration
  def change
    add_reference :books, :Issuer, index: true
    add_foreign_key :books, :Issuers
  end
  
end
