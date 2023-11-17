function gameWindow=plotImage(grid, score, highscore, newHighscoreAcheived, gameComplete, gameOver)
%This function will visualise the 2048 grid in the figure window.

%Initisalise variables
[rows, cols]=size(grid);
logGrid=zeros(rows, cols);

%Iterate through each element of the given grid and apply logarithm. This
% allows the colour scaling of the tiles to be consistent, as the 
% exponential increments in tile value will be converted to linear increments 
for row=1:rows
    for col=1:cols
        logGrid(row, col)=log2(grid(row, col));
    end
end

%Use imagesc function to plot the array once logarithm is applied
gameWindow=imagesc(logGrid, [0, 15]);

%Make the axes and axes labels invisible
xticklabels([]);
yticklabels([]);
axis equal
ax=gca;
ax.XAxis.Visible='off';
ax.YAxis.Visible='off';

%Make colours translucent so the black text can be seen easier
gameWindow.AlphaData=0.7;

%Set the colourmap to allow greater difference between colours of tiles
colormap jet

%Add title
title('2048', 'FontSize', 50)

%Set sizes of axes
axis([-1, 6, 0.5, 4.5])

%Iterate through each nonzero element of original grid (before logarithm applied)
%and add text corresponding to the value of the tile
for row=1:rows
    for col=1:cols
        if grid(row, col)~=0
            text(col, row, num2str(grid(row, col)), 'HorizontalAlignment', 'center', 'FontSize', 34, 'Color', 'black')
        end
    end
end

%Add labels for the current score and highscore
text(-0.9, 1, 'Score: ', 'HorizontalAlignment', 'left', 'FontSize', 34, 'Color', 'black')
text(-0.7, 1.35, num2str(score), 'HorizontalAlignment', 'left', 'FontSize', 34, 'Color', 'black')
text(-0.9, 2, 'Highscore: ', 'HorizontalAlignment', 'left', 'FontSize', 34, 'Color', 'black')
text(-0.7, 2.35, num2str(highscore), 'HorizontalAlignment', 'left', 'FontSize', 34, 'Color', 'black')

%Display messages to the user if the game has been completed, a new
% highscore has been acheived or the game is over.
if newHighscoreAcheived==1
    text(4.6, 1, 'New Highscore!', 'HorizontalAlignment', 'left', 'FontSize', 26, 'Color', 'black')
end
if gameComplete==1
    text(4.6, 2, 'Game Complete!', 'HorizontalAlignment', 'left', 'FontSize', 26, 'Color', 'black')
end
if gameOver==1
    text(4.6, 3, 'Game Over!', 'HorizontalAlignment', 'left', 'FontSize', 26, 'Color', 'black')
end

end