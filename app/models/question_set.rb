class QuestionSet < ActiveRecord::Base

  belongs_to :user_set
  belongs_to :question

  # Create question sets
  def self.create_set(question_ids, user_set_id)
    question_ids.each {|question_id|
      create(question_id: question_id, user_set_id: user_set_id)
    }
  end

  # Submit answer
  def self.submit_question_answer(params)
    extract_value = params[:set].split('-')
    question_set_id = extract_value.first
    question_id = extract_value.second
    answer_id = extract_value.third
    match = QuestionAnswer.compare_question_answer(question_id, answer_id)
    QuestionSet.where(id: question_set_id).last.update_attributes(answer_id: answer_id, is_correct: match)
  end

end
