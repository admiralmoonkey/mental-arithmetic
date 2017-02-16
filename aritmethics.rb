
def problem
  #set starting variable values
  score = 0
  gameOn = false
  a = -2
  b = 2

  puts " ***********************************************************"
  puts " ***********************************************************"
  puts " ** This is a simple mental aritmethics training program. **"
  puts " ** You need to answer correctly in order to proceed.     **"
  puts " ** You get 2 points from each correct answer.            **"
  puts " ** An incorrect answer will terminate the program.       **"
  puts " ** Oh and hey, don't cheat! There's no fun in that ;D    **"
  puts " ***********************************************************"
  puts " ***********************************************************"
  puts ""

  #This loop goes on unti you give a wrong answer
  until gameOn do
    #Levels and adjustment of the random number bounds.
    if score == 20
      puts " ***********************************************************"
      puts " ***********************************************************"
      puts " **                     LEVEL 2                           **"
      puts " ***********************************************************"
      puts " ***********************************************************"
      a = -10
      b = 10
    end
    if score == 50
      puts " ***********************************************************"
      puts " ***********************************************************"
      puts " **                     LEVEL 3                           **"
      puts " ***********************************************************"
      puts " ***********************************************************"
      a = -20
      b = 20
    end
    if score == 200
      puts " ***********************************************************"
      puts " ***********************************************************"
      puts " **                     LEVEL 4                           **"
      puts " ***********************************************************"
      puts " ***********************************************************"
      a = -50
      b = 50
    end
    if score > 300
      puts " ***********************************************************"
      puts " ***********************************************************"
      puts " **                    LEVEL INSANE                       **"
      puts " ***********************************************************"
      puts " ***********************************************************"
      a = -500
      b = 500
    end

    #get random numbers for calculations
    x = Random.rand (a..b)
    y = Random.rand (a..b)
    operator = Random.rand (1..4)
    sign = ""
    xString =""
    yString=""

    #aritmethics operators for printing and calculation
    case operator
    when 1
      sign = "+"
      problem = x + y
    when 2
      sign = "-"
      problem = x - y
    when 3
      sign = "*"
      problem = x * y
    #We need to check not to divide by zero.
    when 4
      generator = false
      until generator do
        if y == 0
          y = Random.rand (-10..10)
        #previous one comes first so that this won't give an error.
        elsif x % y != 0
          y = Random.rand (-10..10)
        else
          generator = true
        end
      end
      sign ="/"
      problem = x / y
    end

    #variables for printing
    if x < 0
      xString = "(#{x})"
    else
      xString ="#{x}"
    end
    if y < 0
      yString +="(#{y})"
    else
      yString = "#{y}"
    end

    puts question = "#{xString} #{sign} #{yString} = ?"
    answer = gets.chomp.to_i

    if problem != 0 && (answer/problem) == 1
      score += 5
      puts "Correct!"
    elsif (answer == 0 && problem == 0)
      score += 5
      puts "Correct!"
    else
      abort("Game over, your score was: #{score}")
    end
  end
end

problem
