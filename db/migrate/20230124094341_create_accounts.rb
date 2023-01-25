class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :contact
      t.string :address
      t.integer :account_no

      t.timestamps
    end
  end
end
