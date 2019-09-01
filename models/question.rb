#  This is just to start you off, it's entirely up to you how to organize your code.

class Question
  attr_reader :question, :answer1, :answer2, :answer3, :answer4, :correct_answer
  def initialize(options)
    @question = options[:question]
    @answer1 = options[:answer1]
    @answer2 = options[:answer2]
    @answer3 = options[:answer3]
    @answer4 = options[:answer4]
    @correct_answer = options[:correct_answer]
  end

  def select_answer(selection)
    @selection = selection
  end

  def check_answer
    if @selection == @correct_answer
      return true
    else
      return false
    end
  end
end