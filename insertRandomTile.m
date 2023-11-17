function grid=insertRandomTile(grid)
%This function will insert a random tile of value 2 or 4 into any of the
% empty cells at random

%Initialise variables
[rows, cols]=size(grid);
emptyCellRows=[];
emptyCellCols=[];

%Iterate through every element in the grid and store the row and column of
% that cell in vectors
for row=1:rows
    for col=1:cols
        if grid(row, col)==0
            emptyCellRows=[emptyCellRows, row];
            emptyCellCols=[emptyCellCols, col];
        end
    end
end

%Select an empty element at random by generating a random index for the
% emptyCellRows (and emptyCellCols) vector
cellNum=randi(length(emptyCellRows));

%Set the value of the new cell to be added. There is a 1/3 chance of it
% being 4, otherwise it will be 2.
if randi(3)==1
    cellValue=4;
else
    cellValue=2;
end

%Update the grid so that the cell corresponding to the random index of
% emptyCellRows is changed from 0 to the determined cell value
grid(emptyCellRows(cellNum), emptyCellCols(cellNum))=cellValue; 

end