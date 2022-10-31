class Question
  attr_reader :text, :answer, :score, :answer_time, :variants

  def initialize(params)
    @answer_time = params[:answer_time].to_i
    @score = params[:score].to_i
    @text = params[:text]
    @answer = params[:answer]
    @variants = params[:variants].shuffle
  end

  def to_s
    "#{@text} (#{@score} баллов, #{@answer_time} секунд на ответ)"
  end
end
