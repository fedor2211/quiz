require "rexml/document"
require_relative "lib/question"
require_relative "lib/quiz"

file = File.open(File.join("data", "questions.xml"))
q_doc = REXML::Document.new(file)
file.close

questions =
  q_doc.root.elements.collect("question") do |question|
    Question.new(
      question.text.strip,
      question.text("answer"),
      question.text("score")
    )
  end

quiz = Quiz.new(questions, 5, 5)
quiz.questions.each.with_index(1) do |question, index|
  puts "#{index}. #{question}"
  start_time = Time.now
  answer = $stdin.gets.chomp
  end_time = Time.now

  if end_time - start_time > quiz.answer_time
    puts "Время ответа было слишком долгое. Викторина завершена."
    break
  end

  if quiz.accept_answer?(question, answer)
    puts "Верный ответ!"
  else
    puts "Неправильно. Правильный ответ: #{question.answer}"
  end
end

puts
puts "Правильных ответов: #{quiz.accepted} из #{quiz.questions.size}"
puts "Вы набрали #{quiz.scores} баллов"
