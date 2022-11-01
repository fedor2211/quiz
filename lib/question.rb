class Question
  attr_reader :text, :answer, :score, :answer_time, :variants

  def initialize(params)
    @answer_time = params[:answer_time].to_i
    @score = params[:score].to_i
    @text = params[:text]
    @answer = params[:answer]
    @variants = params[:variants]
  end

  def to_s
    <<~QUESTION
      #{@text} (#{@score} баллов, #{@answer_time} секунд на ответ)
      #{@variants.map
                 .with_index(1) { |variant, index| "#{index}. #{variant}" }
                 .join("\n")}
    QUESTION
  end
end
