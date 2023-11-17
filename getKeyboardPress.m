function key=getKeyboardPress(grid)
%This function will wait until the user presses an arrow key and that arrow
% key is a valid move.

%Initialise variable
newGrid=grid;

%Check that the button pressed results in a valid move. This means the grid
%will have changed after applying the shiftGrid and mergeCells functions
while newGrid==grid

    %Initialise variables
    key=0;

    %Wait until button pressed is an arrow key.
    %Changed to single "|" as per https://www.reddit.com/r/matlab/comments/zbd6yn/error_operands_to_the_logical_and_and_or/
    while key>31 | key<28

        %Initialise variable k inside while loop in case an invalid key is
        % obtained and k=waitforbuttonpress must occur again
        k=0;

        %Ignore mouse clicks. Otherwise, mouse clicks will cause an error
        while k==0
            k=waitforbuttonpress;
        end

        %Convert button pressed to a variable
        key=double(get(gcf, 'CurrentCharacter'));

    end

    %Apply the shiftGrid and mergeCells functions to newGrid to check that
    % selected arrow is a valid move. Note "score" is irrelevant for this
    % process and is not returned by this function, so input score is set to 0.
    [newGrid, score]=mergeCells(key, grid, 0);
    newGrid=shiftGrid(key, newGrid);
end

end