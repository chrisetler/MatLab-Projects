clear
%Number of trials
%trials = 10000;

%First Loop. Creates the probability dist. for 4 6-sided dice)
%nDice = 2;

%Store the figure as a variable so we can grabe frames
fh = figure(1);

gif_fps = 3; %Framerate for our output
video_filename = 'Dice.gif'; %filename for our output
frameNum = 0;


for trials = [100,1000,100000,1000000];
    for nDice = 1:1:10;
        x = nDice:6*nDice;
        yMax = 5*nDice+1;
        y1 = zeros(1,yMax);
        for i = 1:1:trials;
            %for trials# of cases
            roll=0;
            for k = 1:1:nDice;
                roll = roll + ceil(rand*6);
            end
            %roll = ceil(rand*6)+ceil(rand*6)+ceil(rand*6)+ceil(rand*6); %number between 1 and 6, twice (Add two dice)
            for j = 1:1:yMax;
                if roll == x(j);
                    y1(j) = y1(j)+1;
                end
            end


        end
        %Creates the Plots
        y1 = y1./trials; %makes all probability between 0 and 1
        scatter(x,y1);

        txtOut = strcat('Number of Dice:', num2str(nDice));
        txtOut = strcat(txtOut,' Number of trials:');
        txtOut = strcat(txtOut,num2str(trials));
        title(txtOut);
        xlabel('Sum of Dice');
        ylabel('Probability');
        
        %Make sure we actually get plotted
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
        %pause
    end
end
imwrite(imind,cm,video_filename,'gif','WriteMode','append','DelayTime',6/gif_fps);



var1 = 1/(sqrt(2*pi));
e = exp(1);




