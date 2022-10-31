require "rexml/document"
require_relative "lib/question"

N_QUESTIONS = 5

file = File.open(File.join("data", "questions.xml"))
q_doc = REXML::Document.new(file)
file.close

questions = []
q_doc.root.elements.each("question") do |question|
  questions << Question.new(
    question.text("text"),
    question.text("answer"),
    question.text("score")
  )
end

accepted = 0
scores = 0
questions.sample(N_QUESTIONS).each_with_index do |question, index|
  puts "#{index + 1}. #{question}"
  answer = $stdin.gets.chomp

  if answer == question.answer
    accepted += 1
    scores += question.scores
    puts "Верный ответ!"
  else
    puts "Неправильно. Правильный ответ: #{question.answer}"
  end
end

puts "Правильных ответов: #{accepted} из #{QUESTIONS_QUANTITY}"
puts "Вы набрали #{scores} баллов"
