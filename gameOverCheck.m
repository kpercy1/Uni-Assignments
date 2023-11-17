function checkResult=gameOverCheck(grid)
%This function will check if the game is over. This occurs when there are
% no empty spaces (else some tiles can always be 'pushed' in at least one
% direction) and no two adjacent tiles have the same value (else these
% tiles can be merged). It will return checkResult, a variable with value 1 
% if there are no possible moves and 0 if there are possible moves.

%Initialise variables
[rows, cols]=size(grid);
checkResult=1;

%Iterate through each element in the grid. If any are empty, set
%checkResult to 0
for row=1:rows
    for col=1:cols
        if grid(row, col)==0
            checkResult=0;
        end
    end
end

%Iterate horizontally (from left to right for each row) through elements 
% in the grid aside from the final column. If any element is the same as
% the element on the right, set checkResult to 0.
for row=1:rows
    for col=1:cols-1
        if grid(row, col)==grid(row, col+1)
            checkResult=0;
        end
    end
end

%Iterate vertically (from top to bottom for each column) through elements 
% in the grid aside from the final column. If any element is the same as
% the element on the right, set checkResult to 0.
for col=1:cols
    for row=1:rows-1
        if grid(row, col)==grid(row+1, col)
            checkResult=0;
        end
    end
end

end