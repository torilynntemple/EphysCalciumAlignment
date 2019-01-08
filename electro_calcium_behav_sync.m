function electro_calcium_behav_sync()
clc
% if ~exist('ephys', 'var') && ~exist('ms', 'var') && ~exist('NCS_Files', 'var')% only loads data if data isn't already loaded 
     [ephys, ms,real_event] = loadData(); 
% end
 TraceNum = 30; 
 LFPChannel_1 = 8;
 LFPChannel_2 = 1;
 cell = 2; 
 ephys = createTimeArray(ephys);
%----------------creating a binary vector for recording events------------
%creating the binary plot to test if line up is correct 
sampleFreq = diff(ephys.Events.TimeStamps{1,1});
count=1;
x = [];
y = []; 

for i = 1:length(sampleFreq)%this creates a binary plot to compare with calcium data 
    if sampleFreq(i)>2*mean(sampleFreq)       
        x(count) = ephys.Events.TimeStamps{1,1}(1,i);  
        x(count+1) = ephys.Events.TimeStamps{1,1}(1,i);       
        x(count+2) = ephys.Events.TimeStamps{1,1}(1,i+1);        
        y(count+1) = 0; 
        y(count) = 1;
        y(count+2) = 0;          
        count=count + 3;
     
    else 
     y(count) = 1;    
     x(count) = ephys.Events.TimeStamps{1,1}(1,i);  
     count = count+1;  
    end
    
    if i == length(sampleFreq)
        x(count) = ephys.Events.TimeStamps{1,1}(1,i+1);
        y(count) = 1;
    end 
end

x = [x(1) x]; 
y = [0 y]; 
%-----------------calculating timing of LFP electrode data ----------------

%for the moment we can assume the sampling rate to be 1000 frames per
%second. Creating another vector with timestamps for LFP: 
LFP_timestamp = 1:1:length(ephys.LFP.Data(:,1));
LFP_timestamp = LFP_timestamp./1000; 
LFP_timestamp = LFP_timestamp.';

%-----------------calculating binary traces for each ms--------------------      
 
    for i = 1: length(ms)
       ms(i) = msExtractBinary(ms(i));        
    end 

 
%--------------------------plots-------------------------------------

%the number of traces you wish to display on one graph

figure 
ax1 = subplot (3,1,1);
plot(ephys.LFP.timeVector , ephys.LFP.Data(:,LFPChannel_1)); % choosing the 7th electrode in LFP
title('LFP Traces');
xlabel('Time (seconds)');
ylabel('Amplitude');
hold on 
plot(x,y); 
ylim([min(ephys.LFP.Data(:,LFPChannel_1)), max(ephys.LFP.Data(:,LFPChannel_1))]); 
xlim([0 max(ephys.LFP.timeVector(1,:))]);
hold off

% 
% ax2 = subplot (4,1,2);
% plot(timeVector_ephys, ephys.LFP.Data(:,LFPChannel_2)); % choosing the 7th electrode in LFP
% title('LFP Traces');
% xlabel('Time (seconds)');
% ylabel('Amplitude');
% hold on 
% plot(x,y); 
% ylim([min(ephys.LFP.Data(:,LFPChannel_2)), max(ephys.LFP.Data(:,LFPChannel_2))]); 
% xlim([0 max(ephys.LFP.Data(1,:))]);
% hold off


ax2 = subplot(3,1,2);
msPlotStitching(ms,TraceNum, LFP_timestamp, real_event); 
title('Raw cell traces from calcium imaging');
xlabel('Time (seconds)');
ylabel('Amplitude');

%binary plot
ax3 = subplot(3,1,3);
msPlotStitchingBinary(ms, TraceNum, LFP_timestamp, real_event)
title('Binary traces from calcium imaging');
xlabel('Time (seconds)');
ylabel('Amplitude');


linkaxes([ax1, ax2,ax3], 'x');

%plotting only REM or NONREM
% figure 
% subplot()
% 
% subplot()
 
% ax4 = subplot(4,1,4);
% plot(pulse_newTime, pulse_new)
% 


% figure 
% plot(ephys.data_4_24.Events.TimeStamps{1, 1});

%if you click the graph you can save the datatip positions into an array:
% time_info = cursor_info2time_info (cursor_info) ; 


end