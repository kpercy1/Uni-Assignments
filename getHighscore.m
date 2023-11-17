function highscore=getHighscore(username)
%This function will obtain the highscore for the given username from the
% file highscoreTable.csv. If the file does not exist, it will be created.
% If there is not a highscore available for the given username, a new row
% will be added to the file

%Write the first row of highscoreTable. This is required regardless of the
%existence of the highscoreTable, as this is the header row
highscoreTable=["Name", "Highscore", "Game Completed?"];

%Check if highscoreTable.csv exists
if isfile('highscoreTable.csv')

    %read in data from the file, obtain the row number for the given
    % username. If there is not a row which matches the given username,
    % create a new one with and set highscore to 0. Otherwise, retrieve the
    % higshcore from highscoreTable.csv (as a number, not a string)
    highscoreTable=[highscoreTable; readmatrix('highscoreTable.csv', "OutputType", "string", "NumHeaderLines", 1)];
    usernameRow=getUsernameRow(username, highscoreTable);
    if isempty(usernameRow)
        highscoreTable=[highscoreTable; username, "0", "No"];
        writematrix(highscoreTable, 'highscoreTable.csv')
        highscore=0;
    else
        highscore=str2num(highscoreTable(usernameRow, 2));
    end
   
else
    %If highscoreTable.csv does not exist, create a new file with a header
    % and a single row for the given username
    highscoreTable=[highscoreTable; username, "0", "No"];
    writematrix(highscoreTable, 'highscoreTable.csv')
    highscore=0;
end

%Close all files
fclose('all');

end