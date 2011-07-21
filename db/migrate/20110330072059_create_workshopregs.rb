class CreateWorkshopregs < ActiveRecord::Migration
  def self.up
    create_table :workshopregs do |t|
      t.string :nume
      t.string :clasa
      t.integer :opt1
      t.integer :opt2
      t.integer :opt3
      t.timestamps
    end
  end

  def self.down
    drop_table :workshopregs
  end
end
