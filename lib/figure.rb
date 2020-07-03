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
        \  |  /
         \ | /
      ____\|/____
          /|\
         / | \
        /  |  \
           |

=end

  @@NUMBERS = ["none", "one", "two", "three", "four", "five", "six"]

  def none_wrong
    puts <<-HEREDOC

       |
    \\  |  /
     \\ | /
  ____\\|/____
      /|\\
     / | \\
    /  |  \\
       |

    HEREDOC
  end

  def one_wrong
    puts <<-HEREDOC







           _____
          /     \\
         |       |
         |       |
          \\_____/


    HEREDOC
  end

  def two_wrong
    puts <<-HEREDOC




            ___
          /     \\
         |       |
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
           /   \\
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
       \\_ /     \\
         |       |
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
       \\_ /     \\ _/
         |       |
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
       \\_ /  .  \\ _/
         |   .   |
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