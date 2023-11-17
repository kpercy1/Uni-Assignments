%This program will automatically test the plotImage() function.
% Note to view a test, the final line of all subsequent tests must be
% 'commented out' to prevent the figure from being overwritten.

%Begin by initialising outputWindow as in the code for the main project.
outputWindow=figure('Name','2048','NumberTitle','off', 'Color', 'white', 'WindowState', 'maximized', 'MenuBar', 'none');
title('2048')
ax=gca;
%The following code was obtained from https://au.mathworks.com/matlabcentral/answers/369399-removing-the-grey-margin-of-a-plot
outerpos = ax.OuterPosition;
ti = ax.TightInset; 
left = outerpos(1); %+ ti(1);
bottom = outerpos(2); %+ ti(2);
ax_width = outerpos(3); %- ti(1) - ti(3);
ax_height = outerpos(4); %- ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height-0.1];

%Begin by testing a matrix with only a single tile, and where highscore,
% score, newHighscoreAcheived, gameComplete and gameOver are all zero.
% The user can check that the grid displayed in the command window is
% correctly represented in the figure, and that there are no messages yet
% displayed
input=zeros(4, 4);
input=insertRandomTile(input);
disp(input)
outputWindow=plotImage(input, 0, 0, 0, 0, 0);

%Next, test a matrix containing some tile values which are possible to 
% acheive in a 4x4 grid. Score can be 50 and highscore can be 100,
% gameComplete is 1 while gameOver and newhighscoreAcheived is 0.
% The user can check that the grid displayed in the command window is
% correctly represented in the figure, that there is enough visual difference 
% between the colours of tiles and that there is only a message for
% completing the game
input=[0, 2, 4, 8; 128, 64, 32, 16; 256, 512, 1024, 2048; 32786, 16384, 8192, 4096];
disp(input)
outputWindow=plotImage(input, 50, 100, 0, 1, 0);

%Next, test a matrix containing the remaining tile values which are possible to 
% acheive in a 4x4 grid, and some combinations of multiple tiles. Score and 
% highscore can be the approximate highest score, 3 867 396  (https://i.stack.imgur.com/K7S6G.jpg).
% gameComplete, gameOver and newHighscoreAcheived can all be 1.
% The user can check that the grid displayed in the command window is
% correctly represented in the figure, that there is enough visual difference 
% between the colours of tiles and that all three messages are displayed.
% Note the three highest possible tiles are intentionally the same colour,
% as these tiles will virtually never be acheived and making them all the same 
% colour allows increased visual difference between all other tile values 
input=[32786, 16384, 8192, 4096; 65536, 131072, 0, 0; 256, 256, 128, 128; 256, 0, 128, 128];
disp(input)
outputWindow=plotImage(input, 3867396, 3867396, 1, 1, 1);

