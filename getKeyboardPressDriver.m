%This program will automatically test the getKeyboardPress() function

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

%Initialise a grid with some valid directions and some invalid directions.
% Note to use the first test, the second time input is assigned to a matrix
% should be 'commented out' to prevent the input grid from being overwritten

%Test 1: The left and right arrow keys should be valid as cells can be merged, but the 
% up and down arrow keys should be invalid
input=[1, 2, 3, 4; 5, 6, 6, 7; 8, 9, 10, 11; 12, 13, 14, 15];

%Test 2: The left and down arrow keys should be invalid, but the up and right arrow
% should be valid as cells can be shifted
input=[1, 2, 3, 0; 4, 5, 6, 7; 8, 9, 10, 11; 12, 13, 14, 15];

%Plot grid
gameWindow=plotImage(input, 0, 0, 0, 0, 0);

%Pass input to getKeyboardPress() function twice, and display the returned
%value. For the first test, no keys/clicks should work aside from key=28
%and key=29 (the left and right arrow keys). For the second test, no
%keys/licks should work aside from key=29 and key=30 (the right and up
%arrow keys). This is verified by experimentation by the user
for i=1:2
    key=getKeyboardPress(input);
    disp(key)
end


