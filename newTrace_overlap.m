function newTrace_overlap (ms,cellNum, LFP_timestamp, startTime, trace)
traceNum = cellNum; 
timeVector = (ms.newTime)./1000 + startTime; 
numNeurons = length(trace(1,:));

    if numNeurons >= traceNum
            for trace_i = 1:traceNum
                plot(timeVector,trace(:,trace_i)*1+2*(trace_i-1),'color',[0 0.1 0.5]); hold on;
            end
            ax3711.YLim(2) = max(trace(:,traceNum)*1+2*(traceNum-1));
            xlim([0 max(LFP_timestamp)]);

    else
            for trace_i = 1:numNeurons
                plot(timeVector ,trace(:,trace_i)*1+2*(trace_i-1),'color',[0 0.1 0.5]); hold on;
            end
            ax3711.YLim(2) = max(trace(:,numNeurons)*1+2*(numNeurons-1));
            xlim([0 max(LFP_timestamp)]);
    end
    
    

end 