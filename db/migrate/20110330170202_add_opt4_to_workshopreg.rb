class AddOpt4ToWorkshopreg < ActiveRecord::Migration
  def self.up
    add_column :workshopregs, :opt4, :integer
  end

  def self.down
    remove_column :workshopregs
  end
end
