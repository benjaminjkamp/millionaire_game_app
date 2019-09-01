#  This is just to start you off, it's entirely up to you how to organize your code.
# require the appropriate files from the model and view folders.
require_relative '../models/question.rb'
require_relative '../views/game_viewable.rb'

class GameController
  include GameViewable

  def initialize
    # create a collection of Question objects in this method to start the game.
    @questions = []
    @question1 = Question.new({
      question: "Which disease devastated livestock across the UK during 2001?",
      answer1: "Hand-and-foot",
      answer2: "Foot-in-mouth",
      answer3: "Hand-to-mouth",
      answer4: "Foot-and-mouth",
      correct_answer: "D"
    })
    @questions << @question1
    @question2 = Question.new({
      question: "Which of these kills its victims by constriction?",
      answer1: "Andalucia",
      answer2: "Anaconda",
      answer3: "Andypandy",
      answer4: "Annerobinson",
      correct_answer: "B"
    })
    @questions << @question2
    @question3 = Question.new({
      question: "Which of these might be used in underwater naval operations?",
      answer1: "Frogmen",
      answer2: "Newtmen",
      answer3: "Toadmen",
      answer4: "Tadpolemen",
      correct_answer: "A"
    })
    @questions << @question3
    @question4 = Question.new({
      question: "In the UK, VAT stands for value-added ...?",
      answer1: "Transaction",
      answer2: "Total",
      answer3: "Tax",
      answer4: "Trauma",
      correct_answer: "C"
    })
    @questions << @question4
    
    
  end

  def run
    # write a loop here to run during the program
    # the loop should contain if statements that decides which action is called at a given time of the game.
    index = 0
    level = 0
    levels = [100, 200, 300, 500, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 125000, 250000, 500000, 1000000]
    final = false
    greeting
    puts ""
    puts "Please enter your name:"
    player_name = gets.chomp
    system 'clear'
    puts "Alright, good luck, #{player_name}! Are you ready? (yes/no)"
    ready_input = gets.chomp
    if ready_input == "yes"
      playing = true
    else
      playing = false
    end

    while playing && level <= 15


      until final
        system 'clear'
        puts "Question #{level}: " + @questions[index].question
        puts "A: " + @questions[index].answer1
        puts "B: " + @questions[index].answer2
        puts "C: " + @questions[index].answer3
        puts "D: " + @questions[index].answer4
        puts "(Select an option, enter A, B, C, or D)"
        selection_input = "invalid"
        while selection_input != "valid"
          selection = gets.chomp
          if selection.upcase != "A" && selection.upcase != "B" && selection.upcase && "C" && selection.upcase != "D"
            puts "Invalid entry, please input A, B, C or D"
          else
            selection_input = "valid"
          end
        end
        @questions[index].select_answer(selection.upcase)
        puts ""
        puts "You chose #{selection.upcase}..."
        puts ""
        sleep 1
        puts "..."
        sleep 1
        puts "..."
        puts ""
        sleep 2
        puts "Is that your final answer? Type y or n:"
        confirm = gets.chomp
        
        if confirm == "y"
          puts ""
          puts "."
          sleep 2
          puts ".."
          sleep 3
          puts "..."
          sleep 5
          puts ""
          final = true
          if @questions[index].check_answer
            system 'clear'
            puts "That's Correct! That gets you $#{levels[level]} so far."
            puts ""
            index += 1
            level += 1
          else
            puts "Sorry, that's not correct. The answer was #{@questions[index].correct_answer}: #{@questions[index].answer1}"
            playing = false
          end
        end
        
      end
      if @questions[index] && playing
        puts "What would you like to do?"
        puts "1. Try for the $#{levels[level]} value question"
        puts "2. Walk away with $#{levels[level-1]}."

        action_choice = gets.chomp
      elsif playing == true && @questions[index] == nil
        puts "You won! You win one million dollars!"
        final = true
        playing = false
      end

      if action_choice == "1"
        final = false
      else
        system 'clear'
        puts "You walk away with $#{levels[level-1]}. Congratulations!"
        final =  true
        playing = false
      end


    end
    puts "Thank you for playing!"
  end

  # write other methods in the controller to define (non-rails) controller actions
  # call these methods within your controller 'run' method.
end