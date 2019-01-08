%this function takes multiple calcium trace plots and places them on one
%single plot. 

%the input startTimes states where each calcium trace should begin when
%stiching each session together. 
function msPlotStitchingBinary(ms, cellNum, LFP_timestamp, startTimes)
    % goes through each ms file
    for i =1:length(ms)        
        if any(ismember(fields(ms(i).ms),'RawTraces'))
            ms(i).ms.trace = ms(i).ms.RawTraces;
        end   
            % plots a number of cells specified by cellNum overlapping
            % eachother to see multiple traces within a session 
            trace_overlap(ms(i).ms, cellNum, LFP_timestamp, startTimes(1,i), ms(i).ms.Binary); % plotting REM  from the calcium imaging data
            xlabel('Frames');
            ylabel('Amplitude');
            hold on   

        if  i == length((ms))
            hold off
        end 
    end 
end 