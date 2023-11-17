%This program will automatically test the mergeCells function.

%Initialise variables
gridTestResults=[];
scoreTestResults=[];
input=[];
inputScores=[];


%First, test a merge of two cells in each direction (left, right, up then down)
for i=1:4
    input=[input; 0, 1, 1, 0; 1, 0, 1, 0; 1, 1, 0, 0; 0, 0, 0, 0];
end
keys=[28:31];
expectedOutput=[0, 0, 2, 0; 0, 0, 2, 0; 0, 2, 0, 0; 0, 0, 0, 0];
expectedOutput=[expectedOutput; 0, 2, 0, 0; 2, 0, 0, 0; 2, 0, 0, 0; 0, 0, 0, 0];
expectedOutput=[expectedOutput; 0, 0, 0, 0; 0, 0, 2, 0; 2, 2, 0, 0; 0, 0, 0, 0];
expectedOutput=[expectedOutput; 0, 2, 2, 0; 2, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0];
inputScores=[0, 1, 2, 3];
for i=1:4
    expectedOutputScores(i)=inputScores(i)+2*3;
end

%Next, test merging multiple cells in each direction
for i=1:4
    input=[input; 2, 2, 2, 0; 2, 2, 0, 2; 2, 0, 2, 2; 0, 2, 2, 2];
end
keys=[keys, 28:31];
expectedOutput=[expectedOutput; 0, 4, 2, 0; 0, 4, 0, 2; 0, 0, 4, 2; 0, 0, 4, 2];
expectedOutput=[expectedOutput; 2, 4, 0, 0; 2, 4, 0, 0; 2, 0, 4, 0; 0, 2, 4, 0];
expectedOutput=[expectedOutput; 0, 0, 0, 0; 4, 4, 0, 0; 2, 0, 4, 4; 0, 2, 2, 2];
expectedOutput=[expectedOutput; 2, 2, 2, 0; 4, 4, 0, 2; 0, 0, 4, 4; 0, 0, 0, 0];
inputScores=[inputScores, 4, 5, 6, 7];
for i=5:8
    expectedOutputScores(i)=inputScores(i)+4*4;
end

%Finally, test merging a full matrix
for i=1:4
    input=[input; 3, 3, 3, 3; 3, 3, 3, 3; 3, 3, 3, 3; 3, 3, 3, 3];
end
keys=[keys, 28:31];
expectedOutput=[expectedOutput; 0, 6, 0, 6; 0, 6, 0, 6; 0, 6, 0, 6; 0, 6, 0, 6];
expectedOutput=[expectedOutput; 6, 0, 6, 0; 6, 0, 6, 0; 6, 0, 6, 0; 6, 0, 6, 0];
expectedOutput=[expectedOutput; 0, 0, 0, 0; 6, 6, 6, 6; 0, 0, 0, 0; 6, 6, 6, 6];
expectedOutput=[expectedOutput; 6, 6, 6, 6; 0, 0, 0, 0; 6, 6, 6, 6; 0, 0, 0, 0];
inputScores=[inputScores, 8, 9, 10, 11];
for i=9:12
    expectedOutputScores(i)=inputScores(i)+6*2*4;
end

%Loop through each of the test values
for testNum=1:length(keys)

    %Pass key, grid and score to mergeCell function, making sure to 
    % retrieve four rows of input corresponding to the grid for each test
    [actualOutput, actualOutputScore]=mergeCells(keys(testNum), input(4*testNum-3:4*testNum, :), inputScores(testNum));
    
    %Display result of function (grid)
    disp(actualOutput)

    %Compare expected output to actual output (grids), making sure to retrieve 
    % four rows of expectedOutput corresponding to the grid for each test,
    % and update gridTestResults accordingly
    if expectedOutput(4*testNum-3:4*testNum, :)==actualOutput
        gridTestResults=[gridTestResults, 1];
    else
        gridTestResults=[gridTestResults, 0];
    end

    %Display result of function (score)
    disp(actualOutputScore)

    %Compare expected output to actual output (scores), and update scoreTestResults
    % accordingly.
    if expectedOutputScores(testNum)==actualOutputScore
        scoreTestResults=[scoreTestResults, 1];
    else
        scoreTestResults=[scoreTestResults, 0];
    end

end

%Display results
fprintf('\n Grid test results are:\n')
disp(gridTestResults)
fprintf('\n Score test results are:\n')
disp(scoreTestResults)


