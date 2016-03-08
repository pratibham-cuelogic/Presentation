class Question < ActiveRecord::Base
  belongs_to :technology

  has_many :question_answers
  has_many :answers, :through => :question_answers


  # Right answer for the question
  def right_answer?(answer_id)
    find_answer_id = question_answers.where(is_correct: true).last.answer_id rescue 0
    answer_id == find_answer_id
  end

end
