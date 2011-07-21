class Workshopreg < ActiveRecord::Base
  validates_presence_of :nume, :clasa, :email
end
