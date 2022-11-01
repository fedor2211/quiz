class Quiz
  attr_reader :questions, :scores, :accepted

  def initialize(questions)
    @questions = questions
    @accepted = 0
    @scores = 0
    @question_index = 0
  end

  def current_question
    @questions[@question_index]
  end

  def accept_answer?(answer)
    answer_correct = current_question.variants[answer] == current_question.answer
    if answer_correct
      @accepted += 1
      @scores += current_question.score
    end
    @question_index += 1
    answer_correct
  end

  def over?
    @question_index == @questions.size
  end
end
