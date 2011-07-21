class User < ActiveRecord::Base
  has_many :messages
  has_one :accountInformation, :dependent => :destroy
  accepts_nested_attributes_for :accountInformation, :allow_destroy => true
  acts_as_authentic
end
