%this function converts your NCs files to readable matlab variables and
%saves them into your project folder 

function NCS_Files = nsc2mat()

if ~exist('NCS_Files.CSC1.Timestamps', 'var')
  [NCS_Files.CSC1.Timestamps, NCS_Files.CSC1.ChannelNumbers, NCS_Files.CSC1.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC1.NumberOfValidSamples, NCS_Files.CSC1.Samples, NCS_Files.CSC1.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC1.ncs',...
            [1 1 1 1 1], 1, 1, [] );
        NCS_Files.CSC1.SingleSample = stitchSamples (NCS_Files.CSC1.Samples);
end 

if ~exist('NCS_Files.CSC2.Timestamps', 'var')
  [NCS_Files.CSC2.Timestamps, NCS_Files.CSC2.ChannelNumbers, NCS_Files.CSC2.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC2.NumberOfValidSamples, NCS_Files.CSC2.Samples, NCS_Files.CSC2.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC2.ncs',...
            [1 1 1 1 1], 1, 1, [] );
        NCS_Files.CSC2.SingleSample = stitchSamples (NCS_Files.CSC2.Samples);
end

if ~exist('NCS_Files.CSC3.Timestamps', 'var')
  [NCS_Files.CSC3.Timestamps, NCS_Files.CSC3.ChannelNumbers, NCS_Files.CSC3.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC3.NumberOfValidSamples, NCS_Files.CSC3.Samples, NCS_Files.CSC3.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC3.ncs',...
            [1 1 1 1 1], 1, 1, [] );
        NCS_Files.CSC3.SingleSample = stitchSamples (NCS_Files.CSC3.Samples);
end

if ~exist('NCS_Files.CSC4.Timestamps', 'var')
  [NCS_Files.CSC4.Timestamps, NCS_Files.CSC4.ChannelNumbers, NCS_Files.CSC4.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC4.NumberOfValidSamples, NCS_Files.CSC4.Samples, NCS_Files.CSC4.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC4.ncs',...
            [1 1 1 1 1], 1, 1, [] );
        NCS_Files.CSC4.SingleSample = stitchSamples (NCS_Files.CSC4.Samples);
end

if ~exist('NCS_Files.CSC5.Timestamps', 'var')
  [NCS_Files.CSC5.Timestamps, NCS_Files.CSC5.ChannelNumbers, NCS_Files.CSC5.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC5.NumberOfValidSamples, NCS_Files.CSC5.Samples, NCS_Files.CSC5.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC5.ncs',...
            [1 1 1 1 1], 1, 1, [] );
       NCS_Files.CSC5.SingleSample =  stitchSamples (NCS_Files.CSC5.Samples);
end

if ~exist('NCS_Files.CSC6.Timestamps', 'var')
  [NCS_Files.CSC6.Timestamps, NCS_Files.CSC6.ChannelNumbers, NCS_Files.CSC6.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC6.NumberOfValidSamples, NCS_Files.CSC6.Samples, NCS_Files.CSC6.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC6.ncs',...
            [1 1 1 1 1], 1, 1, [] );
        NCS_Files.CSC6.SingleSample = stitchSamples (NCS_Files.CSC6.Samples);
end

if ~exist('NCS_Files.CSC7.Timestamps', 'var')
  [NCS_Files.CSC7.Timestamps, NCS_Files.CSC7.ChannelNumbers, NCS_Files.CSC7.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC7.NumberOfValidSamples, NCS_Files.CSC7.Samples, NCS_Files.CSC7.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC7.ncs',...
            [1 1 1 1 1], 1, 1, [] );
        NCS_Files.CSC7.SingleSample = stitchSamples (NCS_Files.CSC7.Samples);
end

if ~exist('NCS_Files.CSC8.Timestamps', 'var')
  [NCS_Files.CSC8.Timestamps, NCS_Files.CSC8.ChannelNumbers, NCS_Files.CSC8.SampleFrequencies,...%converts the LFP CSC file into a readbable NCS file in matlab
    NCS_Files.CSC8.NumberOfValidSamples, NCS_Files.CSC8.Samples, NCS_Files.CSC8.Header] = Nlx2MatCSC...
        ('X:\ToriLynn\Jisoo\ElectroCalciumBehavSync\Guillaumes functions\Data\Jisoo LFP data\2018-04-24_09-49-19\CSC8.ncs',...
            [1 1 1 1 1], 1, 1, [] );
       NCS_Files.CSC8.SingleSample = stitchSamples (NCS_Files.CSC8.Samples);
end


end 