function [timeInHours,timeInMinutes, timeInSeconds] = time2seconds(beginningOfRecording, endOfRecording) 

% initialize variables
    NUM_SECONDS_PER_DAY = 86400.0;
    timeStrings = {beginningOfRecording ; endOfRecording}; %entering in the beginning and end time of the LFP recording 
    % convert times to fractional days using datenum
    timeFractionalDays = datenum(timeStrings);
    % leave only the part with the most recent day fraction
    timeDayFraction = mod(timeFractionalDays,1);
    % multiply by number of seconds in a day
    timeInSeconds = timeDayFraction .* NUM_SECONDS_PER_DAY;
    timeInSeconds = timeInSeconds(2) - timeInSeconds(1);
    timeInMinutes = timeInSeconds/60; 
    timeInHours = timeInSeconds/60/60;
    
end 