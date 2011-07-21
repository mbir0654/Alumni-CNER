class AddEmailToWorkshopreg < ActiveRecord::Migration
  def self.up
    add_column :workshopregs, :email, :string
  end

  def self.down
    remove_column :workshopregs, :email
  end
end
