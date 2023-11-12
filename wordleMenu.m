clear all;
close all;
clc

wordleGame;

playAgain = input("Would you like to play again? (Y/N): ", "s");
playAgain = upper(playAgain);

while playAgain ~= "N"

    if playAgain ~= "Y"

        fprintf("Please input a valid option. \n")

    else

        wordleGame;

    end

    playAgain = input("Would you like to play again? (Y/N): ", "s");
    playAgain = upper(playAgain);
    
end

fprintf("\nThank you for playing.")

pause(3)

clear all;
close all;
clc