function interpolate_ephys(ephys, ms, Event) 

% places all the frames from ephys and calcium when the calcium events were 
% being recorded into two structures 
for eventNum = 1:length(Event(:,1))    
    x = find(ephys.Events.TimeStamps{1, 1}   == Event(eventNum,1));
    y = find(ephys.Events.TimeStamps{1, 1}   == Event(eventNum,2));    
    recordedEvents.Ephys{eventNum}= ephys.Events.TimeStamps{1, 1}(1, [x:y]); 
    recordedEvents.Calcium{eventNum}= ms(eventNum).ms.time;     
end 
%need to interpolate events from ephys in order to match the number of
%vectors
for eventNum =1: length(recordedEvents.Ephys)
    count=1;
    for frameNum =1: length(recordedEvents.Ephys{1,eventNum})-1
        
        if frameNum ==1
            temp1 = recordedEvents.Ephys{1,eventNum}(1,count);
            temp2 = recordedEvents.Ephys{1,eventNum}(1,count+1);        
            temp3 = (temp1+temp2)/2; 

            recordedEvents.Ephys{1,eventNum} = [recordedEvents.Ephys{1,eventNum}(1,[1]) ...
                temp3  recordedEvents.Ephys{1,eventNum}(1,[count+1:end])];            
           
        else
            temp1 = recordedEvents.Ephys{1,eventNum}(1,count);
            temp2 = recordedEvents.Ephys{1,eventNum}(1,count+1);        
            temp3 = (temp1+temp2)/2; 

            recordedEvents.Ephys{1,eventNum} = [recordedEvents.Ephys{1,eventNum}(1,[1:count]) ...
                temp3  recordedEvents.Ephys{1,eventNum}(1,[count+1:end])];             
        end 
        count = count+2; 
    end 
end 

end 


