% Define the folder path containing the audio files
inputFolderPath = 'path/to/your/folder';
outputFolderPath = 'path/to/output/folder';

% Ensure the output folder exists
if ~exist(outputFolderPath, 'dir')
    mkdir(outputFolderPath);
end

% Get list of .aac and .m4a files in the input folder
filePatternAac = fullfile(inputFolderPath, '*.aac');
filePatternM4a = fullfile(inputFolderPath, '*.m4a');
aacFiles = dir(filePatternAac);
m4aFiles = dir(filePatternM4a);

% Combine the lists of files
allFiles = [aacFiles; m4aFiles];

% Iterate over each file
for k = 1:length(allFiles)
    baseFileName = allFiles(k).name;
    inputFilePath = fullfile(inputFolderPath, baseFileName);
    
    try
        % Read the audio file
        [audioData, fs] = audioread(inputFilePath);
        
        % Construct the output file path
        [~, name, ~] = fileparts(baseFileName);
        outputFilePath = fullfile(outputFolderPath, [name, '.wav']);
        
        % Write the audio data to a .wav file
        audiowrite(outputFilePath, audioData, fs);
        fprintf('Converted: %s to %s\n', inputFilePath, outputFilePath);
        
    catch ME
        fprintf('Error processing %s: %s\n', inputFilePath, ME.message);
    end
end

disp('Processing complete.');
