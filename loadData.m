function [ephys, ms, real_event, eventTimes] = loadData()
    % loading in ephys and calcium .mat data. Make sure these are in you
    % current folder 
    
    %the follow group of code is able to look through folders and
    %subfolders to find all the ms files in each. 
    Folder   = cd;
    FileList = dir(fullfile(Folder, '**', '*.mat'));     
    pathEphys = FileList(1).folder;
    fileEphys = FileList(1).name; 
    fi = fullfile(pathEphys, fileEphys);
    
    if strcmp(fileEphys,'ephys.mat') || strcmp(fileEphys,'data.mat' )
        load(fi);        
        if strcmp(fileEphys, 'data.mat')
            ephys = data; 
        end                    
    end 
    
    count = 2; 
    for msNum = 2: length(FileList)
       file = FileList(msNum).name;
       path = FileList(msNum).folder;
       fi =  fullfile(path,file);       
       if strcmp(file, 'ms.mat')
         ms(count-1) = load(fi); 
         count = count+1; 
       end        
   end 
             
%        % myFolder1 = dir([pwd '\ephys.mat']); 
%         ephysFiles = myFolder1;
%         baseFile = ephysFiles.name;
%         e.ephysFiles.name = load(baseFile); 
%         ephys.data_4_24 = e.ephysFiles.name.ephys;     
% 
%       % myFolder2 = dir([pwd '\ms*.mat']);        
%        matFiles = myFolder2;  
%            for k = 1:length(matFiles)
%               baseFileName = matFiles(k).name;          
%               ms.matFiles(k).name = load(baseFileName);
%            end

       
%calculating when each event begins (this includes the false events and later will be sorted out into "real_events")
sampFreq = mean(diff(ephys.Events.TimeStamps{1,1})); 
count = 2;
event_begin = [];
event_begin(1,1) = ephys.Events.TimeStamps{1,1}(1,1);
for i= 1: (length(ephys.Events.TimeStamps{1,1})-1)    
    if abs(ephys.Events.TimeStamps{1,1}(1,i) - ephys.Events.TimeStamps{1,1}(1,i+1)) > sampFreq*2
        event_begin(count) = ephys.Events.TimeStamps{1,1}(1,i+1);
        count = count+1; 
    end
end
         
        startTime = zeros(length(event_begin));        
        %figuring out the length of each video without asking: 
        if length(ms)==1
            startTime = ms.ms.numFrames/30 ;    
        else 
            for videoNum = 1: length(ms)
                startTime(videoNum) = (ms(videoNum).ms.numFrames)/30 ;           
            end 
        end 

        %calculating when the end of each event is. 
for j = 2: length(event_begin)+1  
    if j == length(event_begin)+1  
        event_end(j-1) = ephys.Events.TimeStamps{1,1}(1,end);
    else 
        t =  find (event_begin(j) == ephys.Events.TimeStamps{1,1});
        event_end(j-1) = ephys.Events.TimeStamps{1,1}(1,t-1);
    end 
end 
%now to take the difference between the start and end times 
event_length = event_end - event_begin; 


%we need to make a threshold that when past won't consider an event to be
%real. If it does not pass this threshold it will be true and therefore
%saved into real_event. 
threshold = 10; 
i = 1; 
for count = 1: length(event_begin)    
    if (event_length(count) + threshold > startTime(i)) && (event_length(count) - threshold < startTime(i))
        real_event(i) = event_begin(count);
        real_endEvent(i) = event_end(count);
        i = i+1; 
    end 
end 

%-------------time vectors for each event----------------------

Event(:,1) = real_event; 
Event(:,2) = real_endEvent; 

interpolate_ephys(ephys, ms, Event) ;




end 