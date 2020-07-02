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

=end

  @@NUMBERS = ["one", "two", "three", "four", "five", "six"]

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
    send(@@NUMBERS[num_wrong - 1] + "_wrong")
  end

end