function [newHighscoreAcheived, highscore]=newHighscoreCheck(newHighscoreAcheived, score, highscore, username)
%This function will check if a new highscore has been acheived for the 
% given username. It will return newHighscoreAcheived, a variable with
% value 1 if the user has acheived a new highscore and 0 if the user has
% not. It will also update highscoreTable.csv to contain the user's new
% highscore

%Check if score has passed highscore
if score>highscore  

    %Update highscore
    highscore=score; 

    %Create a matrix containing the data of highscoreTable.csv, obtain the
    % row number which contains the given username and update the highscore
    % in that row. Then, write data to highscoreTable.csv
    highscoreTable=["Name", "Highscore", "Game Completed?"; readmatrix('highscoreTable.csv', "OutputType", "string", "NumHeaderLines", 1)];        
    usernameRow=getUsernameRow(username, highscoreTable);    
    highscoreTable(usernameRow, 2)=string(highscore);    
    writematrix(highscoreTable, 'highscoreTable.csv')

    %Check if the highscore has just been received (newHigscoreAcheived
    % will still be zero as it has not yet been updated)
    if newHighscoreAcheived==0   

        %Display a message to the user and update newHighscoreAcheived.
        %Note a message is also displayed on the figure, although this is
        %applied in the plotImage() function
        disp("Congrats, that's a new highscore!")
        newHighscoreAcheived=1;
    end    
end

end