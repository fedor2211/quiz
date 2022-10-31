class Quiz
  attr_reader :questions, :scores, :accepted

  def initialize(questions, n_questions)
    @questions = questions.sample(n_questions)
    @accepted = 0
    @scores = 0
  end

  def accept_answer?(question, answer)
    answer_correct = question.answer == question.answer
    if answer_correct
      @accepted += 1
      @scores += question.score
    end
    answer_correct
  end
end
