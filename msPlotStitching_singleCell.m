function msPlotStitching_singleCell(ms, cellNum, LFP_timestamp, startTimes)
 
for videoNum = 1: length(ms)
  
    if any(ismember(fields(ms(videoNum).ms),'RawTraces'))
        ms(videoNum).ms.trace = ms(videoNum).ms.RawTraces;
    end   
    
        plotCell(ms(videoNum).ms, cellNum, LFP_timestamp, startTimes(1,videoNum), ms(videoNum).ms.trace); % plotting REM  from the calcium imaging data
        xlabel('Frames');
        ylabel('Amplitude');
        hold on    
     
    end  
end


