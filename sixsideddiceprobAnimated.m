clear


%----Code for gif creation
%Store the figure as a variable so we can grabe frames
fh = figure(1);

gif_fps = 3; %Framerate for our output
video_filename = 'Dice.gif'; %filename for our output
frameNum = 0;
%----\

%trials are the number of times we are going to roll the dice
for trials = [100,1000,100000,1000000];
    %this is the number of 6-sided dice we will use
    for nDice = 1:1:10;
        %The range of possible sums. The minimum is each dice is 1, so
        %nDice, the max is each dice is 6, so 6*nDice
        x = nDice:6*nDice;
        %Y is the matrix for each time each of the values occurs. 
        yMax = 5*nDice+1;
        y1 = zeros(1,yMax);
        
        %rolls the dice and adds to the proper y(n), where x(n) = to the
        %current roll
        for i = 1:1:trials;
            %for trials# of cases
            roll=0;
            %roll n number of 6-sided dice and add them to get the current
            %roll
            for k = 1:1:nDice;
                roll = roll + ceil(rand*6);
            end
            
            %find where that roll is on the x-axis and add to the sum 
            for j = 1:1:yMax;
                if roll == x(j);
                    y1(j) = y1(j)+1;
                end
            end


        end
        %Creates the Plots
        y1 = y1./trials; %makes all probability between 0 and 1
        
        %creates the graph
        scatter(x,y1);
        txtOut = strcat('Number of Dice:', num2str(nDice));
        txtOut = strcat(txtOut,' Number of trials:');
        txtOut = strcat(txtOut,num2str(trials));
        title(txtOut);
        xlabel('Sum of Dice');
        ylabel('Probability');
        
        %----Rest of animation script
        drawnow;
        %save current frame
        frame = getframe(fh);
        %render frame as image
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        %Save the gif, appending each new frame to the gif 
        if frameNum == 0;
            %if this is the first frame, save it to a new gif
            imwrite(imind,cm,video_filename,'gif', 'Loopcount',inf);
        else
            %for all the other frames, just append to the file
            imwrite(imind,cm,video_filename,'gif','WriteMode','append','DelayTime',1/gif_fps);
        end
        %So we know which frame we're on
        frameNum = frameNum + 1;
        %----\
        %pause
    end
end
%Added to make the last from last a few more seconds
imwrite(imind,cm,video_filename,'gif','WriteMode','append','DelayTime',6/gif_fps);






