function data = createTimeArray(data)

samplingTime = 1/data.LFP.SamplingRate; %converting sampling frequency from Hz to time
lastPoint = (length(data.LFP.Data)-1)*samplingTime;
timeVector = linspace(0,lastPoint,length(data.LFP.Data)); %given a constant samping frequency
data.LFP.timeVector = timeVector; 
end 