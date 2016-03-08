class QuestionAnswer  < ActiveRecord::Base
  belongs_to :question
  belongs_to :answer

  # Compare question and answer
  def self.compare_question_answer(question_id, answer_id)
    match_ans_count = QuestionAnswer.select('id').where(question_id: question_id, answer_id: answer_id, is_correct: true).count
    match_ans_count > 0
  end

end