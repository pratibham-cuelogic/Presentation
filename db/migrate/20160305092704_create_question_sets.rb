class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.references :user_set, index: true
      t.references :question, index: true
      t.references :answer, index: true
      t.boolean :is_correct, default: false

      t.timestamps
    end
  end
end
