class Figure

=begin
          ___
  _\/    /. .\    \/_
    \    \_^_/    /
     \_ /  .  \ _/
       |   .   |
        \_____/
        /  .  \
       |   .   |
       |   .   |
        \_____/


           |
      \    |    /
        \  |  /
    ______\|/______
          /|\
        /  |  \
      /    |    \
           |

=end

  @@NUMBERS = ["none", "one", "two", "three", "four", "five", "six"]

  def none_wrong
    puts <<-HEREDOC

             |
        \\    |    /
          \\  |  /
            \\|/          A single snowflake. Perfect score so far!
            /|\\
          /  |  \\
        /    |    \\
             |

  HEREDOC
  end

  def one_wrong
    puts <<-HEREDOC







           _____
          /     \\
         |       |        One wrong. One snowball.
         |       |
          \\_____/


    HEREDOC
  end

  def two_wrong
    puts <<-HEREDOC




            ___
          /     \\
         |       |        Two wrong. Two snowballs.
          \\_____/
          /     \\
         |       |
         |       |
          \\_____/


    HEREDOC
  end
  
  def three_wrong
    puts <<-HEREDOC

            ___
           /   \\         Three wrong. The body has a head.
           \\___/
          /     \\
         |       |
          \\_____/
          /     \\
         |       |
         |       |
          \\_____/


    HEREDOC
  end

  def four_wrong
    puts <<-HEREDOC

            ___
    _\\/    /   \\
      \\    \\___/
       \\_ /     \\       Four wrong. An arm appears.
         |       |        Careful....
          \\_____/
          /     \\
         |       |
         |       |
          \\_____/


    HEREDOC
  end

  def five_wrong
    puts <<-HEREDOC

            ___
    _\\/    /   \\    \\/_
      \\    \\___/    /
       \\_ /     \\ _/    Five wrong. And the other arm appears.
         |       |        Almost there....
          \\_____/
          /     \\
         |       |
         |       |
          \\_____/


    HEREDOC
  end

  def six_wrong
    puts <<-HEREDOC

            ___
    _\\/    /. .\\    \\/_
      \\    \\_^_/    /
       \\_ /  .  \\ _/    Six wrong. The Snowman is here!
         |   .   |        You lose!
          \\_____/
          /  .  \\
         |   .   |
         |   .   |
          \\_____/


    HEREDOC
  end

  def snowman(num_wrong)
    send(@@NUMBERS[num_wrong] + "_wrong")
  end

end