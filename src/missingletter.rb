# Init vars and fixtures
question_index = 3 # can be: 1,2,3
num_of_task = 10
tasks = []
good_mark = "\u{1f603}\u{1f44d}"
bad_mark = "\u{1f61f}\u{1f44e}"
clap_mark = "\u{1f44f}"

# Questions bank
questions = {
  'cat' => "\u{1f431}",
  'eye' => "\u{1f441}",
  'ear' => "\u{1f442}",
  'boy' => "\u{1f466}",
  'dog' => "\u{1f436}",
  'fox' => "\u{1f98a}",
  'cow' => "\u{1f42e}",
  'pig' => "\u{1f437}",
  'rat' => "\u{1f42d}",
  'owl' => "\u{1f989}",
  'bug' => "\u{1f41b}",
  'ant' => "\u{1f41c}",
  'egg' => "\u{1f95a}",
  'ice' => "\u{1f9ca}",
  'bus' => "\u{1f68c}",
  'car' => "\u{1f697}",
  'sun' => "\u{2600}",
  'pen' => "\u{1f58a}",
  'key' => "\u{1f511}",
  'gun' => "\u{1f52b}",
  'bed' => "\u{1f6cf}"
}

while tasks.count < num_of_task
  n = rand(0..(questions.count-1))
  tasks << n unless tasks.include? n
end

# Main
system 'clear'
tasks.each { |task|
  q = []
  answered = ''
  task_question = ''
  loop do
      task_answer = questions.keys[task][(question_index-1)].to_s
      q = questions.keys[task].split('')
      q[(question_index-1)] = "\e[31m_\e[0m"
      task_question = "#{questions.values[task]} \u{2192} #{q.join(' ')}"
      system 'clear'
      print " #{task_question} ? "
      answered = STDIN.gets.chomp.to_s
    break if answered.downcase == task_answer.downcase
      q[(question_index-1)] = answered.downcase
      task_question = "#{questions.values[task]} \u{2192} #{q.join(' ')}" 
      system 'clear'
      print " \e[31m#{task_question}\e[0m\n"
      print "Wrong! #{bad_mark}\nTry again.."
      STDIN.getc.chomp
  end
  q[(question_index-1)] = answered.downcase
  task_question = "#{questions.values[task]} \u{2192} \e[32m#{q.join(' ')}\e[0m" 
  system 'clear'
  print " #{task_question}\n"
  print "Good! #{good_mark}\nPress to continue!"
  STDIN.getc.chomp
}
system 'clear'
puts "Finish! #{"\u{1f4af}"}#{clap_mark * 3}"
