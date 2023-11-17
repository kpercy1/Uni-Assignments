function [previousValue, newGrid, score]=combineAdjacentCells(row, col, previousValue, grid, score)
%This function checks if the contents of a cell are the same as the
% previous value, and combines the cell if they are the same. This is done
% using the previousValue vector, which contains the row, column and value
% of the previous nonzero cell (respectively)

%Initialise variable
newGrid=grid;

%If value of the cell is nonzero but not the same as the previous cell,
% reassign previousValue to contain the information of the new cell
if grid(row, col)~=0 && grid(row, col)~=previousValue(3)
    previousValue=[row, col, grid(row, col)];

%If value of the cell is the same as the previous cell, double the value of
% that cell and convert the previous cell to 0. Also increase score by the
% amount of the new cell. Reassign previousValue to contain an
% impossible value so that the row, column and value of the next cell will
% be assigned to previousValue next time this function is called
elseif grid(row, col)==previousValue(3)
    newGrid(row, col)=grid(row, col)*2;
    score=score+newGrid(row, col);
    newGrid(previousValue(1), previousValue(2))=0;
    previousValue=[-1, -1, -1];
end

end