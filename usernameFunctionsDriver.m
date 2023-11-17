%This function automatically tests the following functions:
%       - getUsername()
%       - getHighscore()
%       - newHighscoreCheck()
%       - gameCompleteCheck()










%First, the getUsername() function will be tested.

%To test the creation of a new highscoreTable.csv file, the existing file
% will be deleted. Before that, the data from the previous file will be
% stored in a variable and will be restored to the file at the end of this
% file
if isfile('highscoreTable.csv')
    oldHighscoreTable=["Name", "Highscore", "Game Completed?"];
    oldHighscoreTable=[oldHighscoreTable; readmatrix('highscoreTable.csv', "OutputType", "string", "NumHeaderLines", 1)];

    %Turn on recycle so old data can be retrieved from the recycling bin as
    %backup for existing highscore data
    recycle('on');

    %Delete existing csv file to test if a new csv file can be created by the
    %getHighscore function
    delete('highscoreTable.csv');
end

%Initialise variable
inputUsernames=[];

%Test different usernames. Test cases include an empty string, spaces, 
% special characters, special characters with letters, special characters 
% with spaces, a 'duplicate' username, single quotes and characters from
% another language.
% Test cases:
% Input           Expected output                           Output
% ''              Username cannot be empty...               Username cannot be empty...
% ' '             Username cannot be empty...               Username cannot be empty...
% '""'            Username cannot contain double quotes...  Username cannot contain double quotes...
% 'kfj"aoe'       Username cannot contain double quotes...  Username cannot contain double quotes...
% 'bob'           Username accepted. Username: Bob          Username accepted. Username: Bob
% '$#*&!@%^`+=~'  Username accepted. Username: $#*&!...     Username accepted. Username: $#*&!...
% 'ABC./<>?[]\|'  Username accepted. Username: Abc./...     Username accepted. Username: Abc./... 
% '¢¥§¶\n  À½»'   Username accepted. Username: ¢¥§¶\...     Username accepted. Username: ¢¥§¶\...
% 'BOb'           Username accepted. Username: Bob          Username accepted. Username: Bob
% ''''            Username accepted. Username: ''           Username accepted. Username: ''
% '日本人 中國的'  Username accepted. Username: 日本人 中...  Username accepted. Username: 日本人 中...

%Repeat function a number of times so all of the above usernames can be
% tested
for i=1:7

    %Record usernames for testing of later functions
    inputUsernames=[inputUsernames, getUsername()];

    %Display results of function
    fprintf('Username accepted. Username: %s\n', inputUsernames(i))
end










%Now, the getHighscore() function will be partially tested. Specifically, the
% creation of a new highscoreTable.csv file, the addition of new usernames 
% to the highscoreTable.csv file and the retrieval of existing highscores of 
% 0 will be tested. The retrieval of nonzero highscores will be tested after 
% the newHighscore() function is tested, as the testing of that function will 
% involve some highscores being changed to nonzero values. It is necessary 
% to split the testing of the getHighscore() function in order to create a 
% highscoreTable.csv file to allow testing of the newHighscore() function.

%Display highscoreTable.csv as usernames are added. Note the creation of 
% the new file for the highscore table will be tested when the first
% username is tested, as highscoreTable.csv was deleted above.
for i=1:length(inputUsernames)
    highscoreOutput=getHighscore(inputUsernames(i));

    %As highscoreTable.csv is updated, the user can view the file 
    % as a matrix.
    highscoreTableOutput=["Name", "Highscore", "Game Completed?"];
    highscoreTableOutput=[highscoreTableOutput; readmatrix('highscoreTable.csv', "OutputType", "string", "NumHeaderLines", 1)];
    disp('highscoreTable.csv as a matrix: ')
    disp(highscoreTableOutput)
    
    %As highscoreTable.csv is updated, the user can view the lines of the 
    % file.
    highscoreTableOutput=readlines('highscoreTable.csv');
    disp('Lines of highscoreTable.csv: ')
    for i=1:length(highscoreTableOutput)
        fprintf('%s\n', highscoreTableOutput(i))
    end

    %The user can view the highscore of ith username entered above 
    % (which should always be 0).
    fprintf('The current highscore for that username is: %d\n\n', highscoreOutput)
end










%Now, the newHighscoreCheck() function will be tested.

%Initialise variables
newHighscoreAcheivedTestResults=[];
highscoreTestResults=[];

%Add test cases for a new highscore, not a new highscore and matching the 
% highscore. Note the inputHighscores are all zero because these are the
% current values in the highscoreTable.csv file
inputNewHighscoreAcheived=[0, 0, 0];
inputScore=[10, 0, -10];
inputHighscore=[0, 0, 0];
expectedOutputNewHighscoreAcheived=[1, 0, 0];
expectedOutputHighscore=[10, 0, 0];

%Loop through each of the test cases
for testNum=1:length(inputScore)

    %Pass newHighscoreAcheived, score, highscore and username to 
    % newHighscoreCheck() function
    [actualOutputNewHighscoreAcheived, actualOutputHighscore]=newHighscoreCheck(inputNewHighscoreAcheived(testNum), inputScore(testNum), inputHighscore(testNum), inputUsernames(testNum));

    %Compare expected output to actual output (newHighscoreAcheived), 
    % and update newHighscoreAcheivedTestResults accordingly
    if expectedOutputNewHighscoreAcheived(testNum)==actualOutputNewHighscoreAcheived
        newHighscoreAcheivedTestResults=[newHighscoreAcheivedTestResults, 1];
    else
        newHighscoreAcheivedTestResults=[newHighscoreAcheivedTestResults, 0];
    end

    %Compare expected output to actual output (highscore), 
    % and update highscoreTestResults accordingly
    if expectedOutputHighscore(testNum)==actualOutputHighscore
        highscoreTestResults=[highscoreTestResults, 1];
    else
        highscoreTestResults=[highscoreTestResults, 0];
    end
end

%Finally, check that if a new highscore has already been acheived, that 
% the new highscore message is not displayed but the returned highscore
% is updated (follows on from test case 1 above)
inputNewHighscoreAcheived=1;
inputScore=20;
inputHighscore=10;
expectedOutputNewHighscoreAcheived=1;
expectedOutputHighscore=21;

%Pass newHighscoreAcheived, score, highscore and username to 
% newHighscoreCheck() function
[actualOutputNewHighscoreAcheived, actualOutputHighscore]=newHighscoreCheck(inputNewHighscoreAcheived, inputScore, inputHighscore, inputUsernames(1));

%Compare expected output to actual output (newHighscoreAcheived), 
% and update newHighscoreAcheivedTestResults accordingly
if expectedOutputNewHighscoreAcheived==actualOutputNewHighscoreAcheived
    newHighscoreAcheivedTestResults=[newHighscoreAcheivedTestResults, 1];
else
    newHighscoreAcheivedTestResults=[newHighscoreAcheivedTestResults, 0];
end

%Compare expected output to actual output (highscore), 
% and update highscoreTestResults accordingly
if expectedOutputHighscore==actualOutputHighscore
    highscoreTestResults=[highscoreTestResults, 1];
else
    highscoreTestResults=[highscoreTestResults, 0];
end

%Display results
fprintf('\n Test results for the newHighscoreAcheived variable in the newHighscoreCheck() function are:\n')
disp(newHighscoreAcheivedTestResults)
fprintf('\n Test results for the highscore variable in the newHighscoreCheck() function are:\n')
disp(newHighscoreAcheivedTestResults)










%Now, the retrieval of nonzero highscores using the getHighscore() function
% can be tested (using the first username in inputUsernames).

%Pass first username to getHighscore() function
highscoreOutput=getHighscore(inputUsernames(1));

%The user can view the highscore of the first username, along with the
% expected value (20).
fprintf('The current highscore for the first username is: %d\nThe expected vale is 20\n\n', highscoreOutput)










%Now, the gameCompleteCheck() function will be tested.

%Initialise variables
testResults=[];

%Test output remains at 1 even when 2048 tile is no longer in grid
input=[0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0];
inputGameComplete=[1];
expectedOutput=[1];

%Test matrices containing all zeros, all tiles lower than 2048, zeros aside 
% from one 2048 tile, all tiles up to and including 2048, and multiple 
% tiles of 2048. Note there is no need to test for tiles greater than 2048, 
% as the 2048 tile must have been in a previous grid for these situations, 
% hence gameComplete should already equal 1.
input=[input; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0];
input=[input; 0, 2, 4, 8; 16, 32, 64, 128; 256, 512, 1024, 0; 0, 0, 0, 0];
input=[input; 0, 0, 0, 0; 0, 2048, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0];
input=[input; 0, 2, 4, 8; 16, 32, 64, 128; 256, 512, 1024, 2048; 0, 0, 0, 0];
input=[input; 0, 0, 0, 0; 2048, 2048, 2048, 2048; 0, 0, 0, 0; 0, 0, 0, 0];
inputGameComplete=[inputGameComplete, 0, 0, 0, 0, 0];
expectedOutput=[expectedOutput, 0, 0, 1, 1, 1];

%Loop through each of the test cases
for testNum=1:length(expectedOutput)

    %Pass gameComplete, grid and username to gameCompleteCheck() function, 
    % making sure to retrieve four rows of input corresponding to the 
    % grid for each test
    actualOutput=gameCompleteCheck(inputGameComplete(testNum), input(4*testNum-3:4*testNum, :), inputUsernames(testNum));

    %Compare expected output to actual output, and update testResults
    % accordingly
    if expectedOutput(testNum)==actualOutput
        testResults=[testResults, 1];
    else
        testResults=[testResults, 0];
    end
end

%Display results
fprintf('\n Test results for the gameCompleteCheck() function are:\n')
disp(testResults)

%Restore old highscore data to the highscoreTable.csv file using 
% writematrix.
writematrix(oldHighscoreTable, 'highscoreTable.csv')