class Question
  attr_reader :text, :answer, :scores

  def initialize(text, answer, scores)
    @text = text
    @answer = answer
    @scores = scores.to_i
  end

  def to_s
    "#{@text} (#{@scores} баллов)"
  end
end

