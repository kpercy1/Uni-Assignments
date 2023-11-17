function username=getUsername()
%This function will obtain a username from the user

%Initialise variables
username='';
invalidCharacter=0;

%Get input until the user enters a valid username
while isempty(username)==1 || invalidCharacter==1

    %Initialise variable for check of invalid characters
    invalidCharacter=0;
    
    %Set username to user input
    username=input('Please enter your name: ', "s");

    %Iterate through each character in the given username, and if any are
    % double qoutes ("), set invalidCharacter to 1 (hence the 'while' loop will
    % continue and user must give another username). The username cannot
    % contain double quotes as this was found to give unexpected results
    % during testing (likely because of the use of double quotes to
    % indicate a string and "" to indicate an empty string in matlab). Note single
    % quotes did not seem to have the same issues, so these can be
    % contained
    for i=1:length(username)
        if double(username(i))==34
            invalidCharacter=1;
        end
    end

    %Display messages explaining to the user why their username was invalid
    if invalidCharacter==1
        disp('Username cannot contain double quotes ("). Please enter another username')
    elseif isempty(username)==1
        disp('Username cannot be empty. Please enter another username')
    end
end

%Tidy the username by converting the first character to uppercase and 
% all other characters to lowercase, and converting to string (useful for
% other functions)
username=lower(username);
username(1)=upper(username(1));
username=string(username);

end