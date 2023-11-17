function newGrid=shiftGrid(key, grid)
%This function will shift all the nozero cells in the grid to the furthest
% positions in the direction of the arrow key pressed by the user. For
% example, if the left arrow is pressed, a row of [0, 2, 0, 1] should be
% converted to [2, 1, 0, 0]

%Initialise variables
[rows, cols]=size(grid);
newGrid=grid;

%Iterate through each element in the grid while keeping track of the number 
% of nonzero cells in that row/column. Provided the elements are iterated 
% through in the right 'direction', this allows every nonzero element to
% be assigned to the furthermost empty cell (in their original order) in 
% the direction of the arrow key pressed by the user. Note that although 
% code is similar, slight differences in the direction of iteration makes 
% it difficult to convert code to a single function

%Left arrow --> iterate left to right and assign to lowest column numbers
if key==28
    for row=1:rows
        fullColCount=0;
        for col=1:cols
            if grid(row, col)~=0
                newGrid(row, fullColCount+1)=grid(row, col);
                fullColCount=fullColCount+1;
            end
        end
        for col=fullColCount+1:cols
            newGrid(row, col)=0;
        end
    end

%Right arrow --> iterate right to left and assign to highest column numbers
elseif key==29
    for row=1:rows
        fullColCount=0;
        for col=cols:-1:1
            if grid(row, col)~=0
                newGrid(row, cols-fullColCount)=grid(row, col);
                fullColCount=fullColCount+1;
            end
        end
        for col=1:cols-fullColCount
            newGrid(row, col)=0;
        end
    end

%Up arrow --> iterate top to bottom and assign to lowest row numbers
elseif key==30
    for col=1:cols
        fullRowCount=0;
        for row=1:rows
            if grid(row, col)~=0
                newGrid(fullRowCount+1, col)=grid(row, col);
                fullRowCount=fullRowCount+1;
            end
        end
        for row=fullRowCount+1:rows
            newGrid(row, col)=0;
        end
    end

%Down arrow --> iterate bottom to top and assign to highest row numbers
elseif key==31
    for col=1:cols
        fullRowCount=0;
        for row=rows:-1:1
            if grid(row, col)~=0
                newGrid(rows-fullRowCount, col)=grid(row, col);
                fullRowCount=fullRowCount+1;
            end
        end
        for row=1:rows-fullRowCount
            newGrid(row, col)=0;
        end
    end
end

end