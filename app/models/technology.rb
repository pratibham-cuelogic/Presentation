class Technology < ActiveRecord::Base

  has_many :questions
  has_many :user_sets
  validates_uniqueness_of :name, case_sensitive: false

end
