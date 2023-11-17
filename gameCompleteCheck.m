function gameComplete=gameCompleteCheck(gameComplete, grid, username)
%This function will check if the user has completed the game by obtaining
%the 2048 tile. It will return gameComplete, a variable with value 1 if the
% game has already been completed and 0 if it has not.

%Initialise variables
[rows, cols]=size(grid);

%Only necessary to chech that if the game has been complete if it has not
% been completed earlier
if gameComplete==0

    %Iterate through each element in grid and check if the tile value is
    % 2048
    for row=1:rows
        for col=1:cols
            if grid(row, col)==2048

                %Return variable which shows the game has been completed
                gameComplete=1;

                %Display message to the user
                disp('Congrats, you have completed 2048!')

                %Update highscoreTable.csv by reading data into a matrix,
                % then updating the "Game Complete?" column for the given
                % username
                highscoreTable=["Name", "Highscore", "Game Completed?"; readmatrix('highscoreTable.csv', "OutputType", "string", "NumHeaderLines", 1)];
                usernameRow=getUsernameRow(username, highscoreTable);
                highscoreTable(usernameRow, 3)="Yes";
                writematrix(highscoreTable, 'highscoreTable.csv')
            end
        end
    end
end

end