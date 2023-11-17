%This program will test the insertRandomTile function. 

% It produces a probability matrix for the distribution of changed tiles, 
% and a value matrix for the distribution of the values of these  tiles. 
% The probability matrix allows the user to check that the probability of a 
% tile being inserted is the same for every empty tile, and the value 
% matrix allows the user to check that the probabilities for different values 
% of the changed tile is working as expected. The program also tests that 
% only 1 tile is changed each time the function is called, and that the 
% value of this tile is either 2 or 4.

%Initialise variables
tileNumberFail=0;
tileValueFail=0;
emptyElements=["1,1", "1,2", "1,3", "2,1", "2,2", "2,3", "3,1", "3,2", "3,3"];
input=zeros(3, 3);

%Repeat process for different numbers of tiles 
for i=1:8

    %Select an empty element of the input function at random using the
    %emptyElements vector, and convert to character array to access the
    %numbers
    randNum=randi(length(emptyElements));
    element=char(emptyElements(randNum));
    emptyElements(randNum)=[];
    row=str2num(element(1));
    col=str2num(element(3));

    %Equate the selected element to the iteration number
    %(any nonzero number should work the same)
    input(row, col)=i;

    %Initialise probabilityMatrix and valueMatrix for the results of the 
    % new input matrix
    probabilityMatrix=zeros(3, 3);
    valueMatrix=zeros(1, 2);

    %Repeat a large number of times so accurate averages can be obtained
    for k=1:10000

        %Initialise newTileCount for each time the function is run
        newTileCount=0;

        %Run the function
        actualOutput=insertRandomTile(input);

        %Iterate through the elements of the actualOutput matrix
        for m=1:3
            for n=1:3

                %Check which tiles the function has changed
                if actualOutput(m, n)~=0 && input(m, n)==0

                    %Track the number of tiles changed by the function
                    newTileCount=newTileCount+1;

                    %Where the function has changed a tile, add to the 
                    % corresponding element in probabilityMatrix
                    probabilityMatrix(m, n)=probabilityMatrix(m, n)+1/10000;

                    %Check the value of the tile changed by the function.
                    % Add to valueMatrix accordingly, and record if the
                    % value of the tile is not as expected
                    if actualOutput(m, n)==2
                        valueMatrix(1, 1)=valueMatrix(1, 1)+1/10000;
                    elseif actualOutput(m, n)==4
                        valueMatrix(1, 2)=valueMatrix(1, 2)+1/10000;
                    else
                        titleValueFail=1;ky
                    end

                end
            end
        end

        %Record if the number of tiles changed by the function is not 1 as 
        % expected
        if newTileCount~=1
            tileNumberFail=1;
        end
    end

    %Display probabilityMatrix and valueMatrix, to be evaluated by the user
    disp(probabilityMatrix)
    disp(valueMatrix)

    % Expected output for probabilityMatrix:
    %       Iteration 1 - 8 tiles with probability of ~0.125
    %                     1 tile with probability of 0
    %       Iteration 2 - 7 tiles with probability of ~0.143
    %                     2 tiles with probability of 0
    %       Iteration 3 - 6 tiles with probability of ~0.167
    %                     3 tiles with probability of 0
    %       Iteration 4 - 5 tiles with probability of ~0.200
    %                     4 tiles with probability of 0
    %       Iteration 5 - 4 tiles with probability of ~0.250
    %                     5 tiles with probability of 0
    %       Iteration 6 - 3 tiles with probability of ~0.333
    %                     6 tiles with probability of 0
    %       Iteration 7 - 2 tiles with probability of ~0.5
    %                     7 tiles with probability of 0
    %       Iteration 8 - 1 tile with probability of 1
    %                     8 tiles with probability of 0

    % Expected output for valueMatrix:
    %       [~0.667, ~0.333] for all iterations

end

%Notify the user of whether the number of tiles changed by the function and
%the value of these tiles are as expected
if tileNumberFail==1
    disp('Incorrect number of added tiles')
else
    disp('Correct number of added tiles')
end
if tileValueFail==1
    disp('Incorrect value of added tiles')
else
    disp('Correct value of added tiles')
end





