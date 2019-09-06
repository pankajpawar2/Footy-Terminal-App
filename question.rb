class Question
  attr_reader :question
  attr_reader :option1
  attr_reader :option2
  attr_reader :option3
  attr_reader :option4
  attr_reader :answer
  def initialize(question, option1, option2, option3, option4, answer)
    @question = question
    @option1 = option1
    @option2 = option2
    @option3 = option3
    @option4 = option4
    @answer = answer
  end
end
