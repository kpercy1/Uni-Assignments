%This program will automatically test the shiftGrid function.

%Initialise variables
testResults=[];
input=[];

%First, test simple shifts in each direction (left, right, up then down).
% Includes shifts of 0-3 positions
for i=1:4
    input=[input; 1, 0, 0, 0; 0, 2, 0, 0; 0, 0, 3, 0; 0, 0, 0, 4];
end
keys=[28:31];
expectedOutput=[1, 0, 0, 0; 2, 0, 0, 0; 3, 0, 0, 0; 4, 0, 0, 0];
expectedOutput=[expectedOutput; 0, 0, 0, 1; 0, 0, 0, 2; 0, 0, 0, 3; 0, 0, 0, 4];
expectedOutput=[expectedOutput; 1, 2, 3, 4; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0];
expectedOutput=[expectedOutput; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0; 1, 2, 3, 4];

%Next, test shifting multiple cells in each direction. Includes shifts with
% some different orientations; for each direction, the following situations 
% are tested:
%   -shift both elements 2 positions, 
%   -shift one element 2 positions and another element 1 position, 
%   -shift one element 1 postition and another element 0 positions, and 
%   -shift both elements 0 positions
for i=1:4
    input=[input; 1, 2, 0, 0; 3, 0, 4, 0; 0, 5, 0, 6; 0, 0, 7, 8];
end
keys=[keys, 28:31];
expectedOutput=[expectedOutput; 1, 2, 0, 0; 3, 4, 0, 0; 5, 6, 0, 0; 7, 8, 0, 0];
expectedOutput=[expectedOutput; 0, 0, 1, 2; 0, 0, 3, 4; 0, 0, 5, 6; 0, 0, 7, 8];
expectedOutput=[expectedOutput; 1, 2, 4, 6; 3, 5, 7, 8; 0, 0, 0, 0; 0, 0, 0, 0];
expectedOutput=[expectedOutput; 0, 0, 0, 0; 0, 0, 0, 0; 1, 2, 4, 6; 3, 5, 7, 8];

%Finally, test shifting a full matrix
for i=1:4
    input=[input; 1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16];
end
keys=[keys, 28:31];
for i=1:4
    expectedOutput=[expectedOutput; 1, 2, 3, 4; 5, 6, 7, 8; 9, 10, 11, 12; 13, 14, 15, 16];
end

%Loop through each of the test values
for testNum=1:length(keys)

    %Pass key and grid to shiftGrid function, making sure to retrieve four 
    % rows of input corresponding to the grid for each test
    actualOutput=shiftGrid(keys(testNum), input(4*testNum-3:4*testNum, :));
    
    %Display result of function
    disp(actualOutput)

    %Compare expected output to actual output, making sure to retrieve four rows 
    % of expectedOutput corresponding to the grid for each test, and update
    % testResults accordingly
    if expectedOutput(4*testNum-3:4*testNum, :)==actualOutput
        testResults=[testResults, 1];
    else
        testResults=[testResults, 0];
    end
end

%Display results
fprintf('\n Test results are:\n')
disp(testResults)


