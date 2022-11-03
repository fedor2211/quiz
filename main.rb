require "rexml/document"
require_relative "lib/question"
require_relative "lib/quiz"

file = File.open(File.join("data", "questions.xml"))
q_doc = REXML::Document.new(file)
file.close

questions =
  q_doc.root.elements.collect("question") do |question|
    variants =
      question.elements.collect("variants/variant") do |variant|
        variant
      end
    Question.new(
      answer: variants.find { |variant| variant["right"] == "true" }.text,
      variants: variants.map(&:text).shuffle,
      text: question.text("text"),
      score: question["score"],
      answer_time: question["seconds"]
    )
  end

quiz = Quiz.new(questions.shuffle)
until quiz.over?
  question = quiz.current_question
  puts question
  start_time = Time.now
  answer = $stdin.gets
  end_time = Time.now

  if end_time - start_time > question.answer_time
    puts "Время ответа было слишком долгое. Викторина завершена."
    break
  end

  if quiz.accept_answer!(answer.to_i - 1)
    puts "Верный ответ!"
  else
    puts %(Неправильно. Правильный ответ: "#{question.answer}")
  end
end

puts
puts "Правильных ответов: #{quiz.accepted} из #{quiz.questions.size}"
puts "Вы набрали #{quiz.scores} баллов"
