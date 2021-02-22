class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :client_id
      t.string :email
      t.string :password_digest
      t.string :token
      t.timestamps
    end
    add_index :clients, :email
    add_index :clients, :token
    add_index :clients, :client_id
  end
end
