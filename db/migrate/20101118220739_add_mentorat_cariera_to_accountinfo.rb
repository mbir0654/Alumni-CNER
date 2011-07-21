class AddMentoratCarieraToAccountinfo < ActiveRecord::Migration
  def self.up
    add_column :account_informations, :cariera, :integer
    add_column :account_informations, :mentor, :integer
  end

  def self.down
    remove_column :account_informations, :cariera
    remove_column :account_informations, :mentor
  end
end
