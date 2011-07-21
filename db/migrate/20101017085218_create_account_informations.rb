class CreateAccountInformations < ActiveRecord::Migration
  def self.up
    create_table :account_informations do |t|
      t.integer :user_id
      t.string :nume
      t.string :prenume
      t.integer :promotia
      t.string :adresa
      t.string :email
      t.string :specializare
      t.string :domeniucurent
      t.tinyint :mentor
      t.tinyint :cariera
      t.timestamps
    end
  end

  def self.down
    drop_table :account_informations
  end
end
