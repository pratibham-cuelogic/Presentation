class Answer < ActiveRecord::Base
  belongs_to :technology

  has_many :question_answers
  has_many :questions, :through => :question_answers
end
