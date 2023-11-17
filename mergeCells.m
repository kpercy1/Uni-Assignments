function [newGrid, score]=mergeCells(key, grid, score)
%This function will merge adjacent cells of the same value in the direction of the 
% arrow key pressed by the user. It will also update score

%Initialise variables. See combineAdjacentCells() comments for explanation
%of why previousValue should be initialised to an impossible value
[rows, cols]=size(grid);
previousValue=[-1, -1, -1];
newGrid=grid;

%For each direction, use the combineAdjacentCells() function to update
% previousValue, newGrid and score for each element in grid. The direction
% and order through which the elements of grid are iterated through is
% specific to each direction. For example, when the left arrow is pressed
% (key=28), the elements of each row should be iterated from left to right
% so that pairs closest to the left edge of the grid will merge first.
% previusValue should also be reinitialised in each iteration of the outer
% loop, preventing merging in the wrong direction.

%Left arrow --> iterate left to right
if key==28
    for row=1:rows
        for col=1:cols
            [previousValue, newGrid, score]=combineAdjacentCells(row, col, previousValue, newGrid, score);
        end
        previousValue=[-1, -1, -1];
    end

%Right arrow --> iterate right to left
elseif key==29
    for row=1:rows
        for col=cols:-1:1
            [previousValue, newGrid, score]=combineAdjacentCells(row, col, previousValue, newGrid, score);
        end
        previousValue=[-1, -1, -1];
    end

%Up arrow --> iterate top to bottom
elseif key==30
    for col=1:cols
        for row=1:rows
            [previousValue, newGrid, score]=combineAdjacentCells(row, col, previousValue, newGrid, score);
        end
        previousValue=[-1, -1, -1];
    end

%Down arrow --> iterate bottom to top
elseif key==31
    for col=1:cols
        for row=rows:-1:1
            [previousValue, newGrid, score]=combineAdjacentCells(row, col, previousValue, newGrid, score);
        end
        previousValue=[-1, -1, -1];
    end
end

end