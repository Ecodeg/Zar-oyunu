row=input('Please Enter A Value For The Row Amount: ');
column=input('Please Enter A Value For The Column Amount: ');
matrix=round(2+33*rand(row,column));
disp(matrix);
temp=matrix; %to preserve the initial state of the matrix


while 1
    %dice roll
    dice=round(1+5*rand(1,3));
    dice1=dice(1,1);
    dice2=dice(1,2);
    dice3=dice(1,3);
    fprintf('The Values ​​Of The Dices: %d %d %d \n',dice1,dice2,dice3);


    %maximum calculation
    if dice1>=dice2 && dice1>=dice3
        maximumValue=dice1;
    elseif dice2>=dice1 && dice2>=dice3
        maximumValue=dice2;
    else %dice3>=dice1 && dice3>=dice2
        maximumValue=dice3;
    end
    fprintf('Maximum Value: %d\n',maximumValue);


    %median calculation
    if dice1>=dice2 && dice1<=dice3 || dice1<=dice2 && dice1>=dice3
        medianValue=dice1;
    elseif dice2>=dice1 && dice2<=dice3 || dice2<=dice1 && dice2>=dice3
        medianValue=dice2;
    else %dice3>=dice2 && dice3<=dice1 || dice3<=dice2 && dice3>=dice1
        medianValue=dice3;
    end
    fprintf('Median Value: %d\n',medianValue);


    %minumum calculation
    if dice1<=dice2 && dice1<=dice3
        minumumValue=dice1;
    elseif dice2<=dice1 && dice2<=dice3
        minumumValue=dice2;
    else %dice3<=dice1 && dice3<=dice2
        minumumValue=dice3;
    end
    fprintf('Minumum Value: %d\n',minumumValue);

    number=maximumValue*medianValue+minumumValue; %calculating the number
    fprintf('Number: %d\n',number);
    temp=matrix; %to keep the matrix as it was after getting -1
    
    %the part where the number we calculate is searched in the matrix
    for i=1:row
        for j=1:column
            if matrix(i,j)==number %The part where -1 is made when the searched number is found in the matrix
                matrix(i,j)=-1;
                disp(matrix);
                fprintf('Where matrix value is assigned -1: M(%d,%d)\n',i,j);
                fprintf('\n');
            end
            
        end
    end
    if temp==matrix %The part that informs that the searched number is not found in the matrix
        disp('No matching numbers found');
        fprintf('\n');
    end
    

    %the part that stops the program when a row is full -1
    for k=1:row
        counter=0;
        for l=1:column
            if matrix(k,l)==-1
                counter=counter+1;
                if counter==column
                    return;
                end
            end
        end
    end
end