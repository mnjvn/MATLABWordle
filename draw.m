function [] = draw()
close all;

f = figure("Name", "WORDLE", "NumberTitle", "Off");
f.Position = [0, 0, 1200, 1200];
axis off;

for i = 1:5

    for j = 1:6

        rectangle(Position = [200 * (i - 1), 200 * (j - 1), 200, 200], FaceColor = "#0e1111", EdgeColor = "#808080", LineWidth = 3) % Creates grey square

    end

end

end