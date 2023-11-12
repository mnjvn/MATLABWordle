function [] = wordleGame()

clear all;
close all;
clc
    
fprintf("Welcome to Wordle! \n\n")

% Allowed Inputs sourced from: https://github.com/charlesreid1/five-letter-words/blob/master/sgb-words.txt

allowedInputsRaw = fileread("allowedInputs.txt");
allowedInputs = splitlines(allowedInputsRaw);
allowedInputs = allowedInputs(1:end-1);

% Dictionary of solutions sourced fromL https://gist.github.com/cfreshman/a03ef2cba789d8cf00c08f767e0fad7b

dictWordsRaw = fileread("dictWords.txt");
dictWords = splitlines(dictWordsRaw);
dictWords = dictWords(1:end-1);

randomNum = randi(2314);
word = dictWords(randomNum);

word = char(word);

testMode = input("Show correct word? (Y/N): ", "s"); 
testMode = upper(testMode); 

if testMode ~= "Y" && testMode ~= "N"

    fprintf("Please input a valid option.")

else

    if testMode == "Y"

        fprintf("\nCorrect word is: %s \n", word)

    end

end

correct = 0;
inputNum = 1;

draw; 
hold on;

while correct == 0 && inputNum <= 6

    fprintf("\n")
    inputWord = input("Input a 5 letter word: ", "s");
    inputWord = lower(inputWord);

    wordCheckGreen = char(word);
    wordCheckYellow = char(word);

    if 0 == any(strcmp(allowedInputs, inputWord)) && inputWord ~= "haine"

        fprintf("\nWord you have input is not valid, try again. \n")

    else

        if 1 == strcmp(word, inputWord)

            correct = 1;

        end

        for i = 1:5

            rectangle(Position = [200 * (i - 1), 1000 - 200 * (inputNum - 1), 200, 200], FaceColor = "#696969", EdgeColor = "#808080", LineWidth = 3)

            for j = 1:5

                if 1 == strcmp(word(j), inputWord(j))

                    rectangle(Position = [200 * (j - 1), 1000 - 200 * (inputNum - 1), 200, 200], FaceColor = "#00D100", EdgeColor = "#808080", LineWidth = 3)

                    wordCheckGreen(j) = "0";
                    wordCheckYellow(j) = "0";

                end

            end

            if 1 == contains(wordCheckYellow, inputWord(i))

                for j = 1:5

                    if 1 == strcmp(wordCheckYellow(j), inputWord(i))

                        wordCheckYellow(j) = "0";
                        break

                    end

                end

                rectangle(Position = [200 * (i - 1), 1000 - 200 * (inputNum - 1), 200, 200], FaceColor = "#FFC300", EdgeColor = "#808080", LineWidth = 3)

            end

        end

        for i = 1:5

            text(85 + 200 * (i-1), 1100 - 200 * (inputNum - 1), upper(inputWord(i)), FontSize = 40, Color = "w", FontName = "AvantGarde", FontWeight = "bold")

        end

        inputNum = inputNum + 1;
       
    end  

    if inputWord == "haine"

        web("https://youtu.be/IFkHadvj4DI");

    end

end

if correct == 1

    fprintf("\nCongratulations you've won! You got the word correct in %0.0f attempts. \n\n", (inputNum-1))

else

    fprintf("\nYou lost.  Correct word was %s. \n\n", word)

end

end