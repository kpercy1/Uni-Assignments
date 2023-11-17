%This function will automatically test the gameOverCheck() function

%Initialise variables
testResults=[];

%First, add a test with only a single tile
input=[0, 0, 0; 0, 1, 0; 0, 0, 0];
expectedOutput=[0];

%Next, add a test for all different tiles
input=[input; 1, 2, 3; 4, 5, 6; 7, 8, 9];
expectedOutput=[expectedOutput, 1];

%Next, add a test with one empty tile
input=[input; 1, 2, 3; 4, 5, 6; 7, 8, 0];
expectedOutput=[expectedOutput, 0];

%Next, add a test with all tiles fill but a merge possible
input=[input; 1, 2, 3; 4, 5, 6; 7, 8, 8];
expectedOutput=[expectedOutput, 0];

%Loop through each of the test values
for testNum=1:length(expectedOutput)

    %Pass grid to gameOverCheck function, making sure to retrieve three 
    % rows of input corresponding to the grid for each test
    actualOutput=gameOverCheck(input(3*testNum-2:3*testNum, :));

    %Compare expected output to actual output, and update testResults 
    % accordingly
    if expectedOutput(testNum)==actualOutput
        testResults=[testResults, 1];
    else
        testResults=[testResults, 0];
    end

end

%Display results
fprintf('\n Test results are:\n')
disp(testResults)
