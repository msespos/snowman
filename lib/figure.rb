class Figure

=begin
          ___
  _\/    /   \    \/_
    \    \___/    /
     \_ /  .  \ _/
       |   .   |
        \_____/
        /  .  \
       |   .   |
       |   .   |
        \_____/

=end
         
  def bottom_third
    puts <<-HEREDOC
     _____
    /     \\
   |       |
   |       |
    \\_____/
    HEREDOC
  end
  
  def snowman
    bottom_third
  end

  
end

figure = Figure.new
figure.snowman