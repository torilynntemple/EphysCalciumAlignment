function plotCell (ms, cellNum, LFP_timestamp, startTime, trace)
traceNum = cellNum; 
timeVector = (ms.time)./1000 + startTime; 
plot(timeVector,trace(:,traceNum));
xlim([0 max(LFP_timestamp)]);
ax3711.YLim(2) = max(trace(:,traceNum)*1+2*(traceNum-1));

end 