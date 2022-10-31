class Quiz
  attr_reader :answer_time, :questions, :scores, :accepted

  def initialize(questions, n_questions, answer_time)
    @questions = questions.sample(n_questions)
    @accepted = 0
    @scores = 0
    @answer_time = answer_time
  end

  def accept_answer?(question, answer)
    answer_correct = question.answer == answer
    if answer_correct
      @accepted += 1
      @scores += question.scores
    end
    answer_correct
  end
end
