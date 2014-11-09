%Author: Chris Etler
%Date: 9 November 2014
%Desc: Generates 4 six-sided dice and rolls them all a bunch of times and takes the sum, then creates a scatter plot
%      of all the outputs and the number of times they occured. Then this is altered so that the max is one. Then the
%      plot is changed from 3-24 (the posible sums of the dice) to -3 to 3 (similar to a normal distribution around 0).
%      then the y is multipled by 3.5 so that its peak is the same as the peak of a normal dist. with sigma of 0. 
%      The final graph shows this modified functin and the normal function as a comparision.

%Goal: The goal was to find how accurate rolling 4 6-sided dice could be when trying to come up with random numbers in a normal gaussian distribution. 
%Result: It works well.


clear
%Number of trials
trials = 100000;

%First Loop. Creates the probability dist. for 4 6-sided dice)
y1 = zeros(1,22);
x = 3:24;

for i = 1:1:trials;
    %for trials# of cases
    roll = ceil(rand*6)+ceil(rand*6)+ceil(rand*6)+ceil(rand*6); %number between 1 and 6, twice (Add two dice)
    for j = 1:1:22;
        if roll == j+2;
            y1(j) = y1(j)+1;
        end
    end
    
        
end



%Creates the Plots
y1 = y1./trials; %makes all probability between 0 and 1
x = (((x-3)./22).*6)-3; %makes it between -1 and 1




var1 = 1/(sqrt(2*pi));
e = exp(1);

plot(x,y1.*3.5238,x,var1*e.^(-((x.^(2))/2)));



