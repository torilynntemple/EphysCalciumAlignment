%this function takes multiple calcium trace plots and places them on one
%single plot. 

function newMsPlotStitching(ms, cellNum, LFP_timestamp, startTimes)

for i =1:length(ms)
        
    if any(ismember(fields(ms(i).ms),'RawTraces'))
        ms(i).ms.trace = ms(i).ms.newRawTrace;
    end   
        newTrace_overlap(ms(i).ms, cellNum, LFP_timestamp, startTimes(1,i), ms(i).ms.trace); % plotting REM  from the calcium imaging data
        xlabel('Frames');
        ylabel('Amplitude');
        hold on   
    
    if  i == length(fieldnames(ms))
        hold off
    end 
end 
end 