function usernameRow=getUsernameRow(username, highscoreTable)
%This function will obtain the row number which contains the given username

%Create a matrix of whether the element of highscoreTable is identical
%to the given username. If corresponding cells are identical,
%usernameCheckMatrix will contain 1, otherwise it will contain 0. Note
%because a match between the username and elements of the header will not 
% be checked, the row number in usernameCheckMatrix is 1 less than the row
% number of the corresponding tile in highscoreTable
usernameCheckMatrix=strcmp(highscoreTable(2:end, :), username);

%Find the row number (if it exists) where the given username matches an
%element in the first column. Note 1 is added to this value to account for
%the header (which was excluded above)
usernameRow=find(usernameCheckMatrix(:, 1))+1;

end