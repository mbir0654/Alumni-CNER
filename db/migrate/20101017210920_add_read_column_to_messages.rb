class AddReadColumnToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :read, :tinyint, :default => 0
  end

  def self.down
  end
end
