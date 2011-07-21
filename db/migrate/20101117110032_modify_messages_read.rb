class ModifyMessagesRead < ActiveRecord::Migration
  def self.up
    rename_column :messages, :read, :r
  end

  def self.down
    rename_column :messages, :r, :read
  end
end
