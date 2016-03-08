class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.references :technology, index: true

      t.timestamps
    end
    create_table :answers do |t|
      t.text :description

      t.timestamps
    end
    create_table :question_answers do |t|
      t.belongs_to :question, index: true
      t.belongs_to :answer, index: true
      t.boolean :is_correct, default: false
    end
  end
end
