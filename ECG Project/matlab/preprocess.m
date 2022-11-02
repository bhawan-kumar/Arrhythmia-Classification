folder = 'C:\Users\SaiGanesh\Desktop\ECG project\ECGData';
if ~isfolder(folder)
    errorMssg = sprintf('Error: The following folder does not exist');
end

filePattern = fullfile(folder, '*.csv');
files = dir(filePattern);
features = zeros(length(files), 41);

for k = 1: length(files)
    fileName = files(k).name;
    fullPath = fullfile(files(k).folder, fileName);
    fprintf(1, 'Now reading %s\n', fileName);
    file = readtable(fullPath);

    fs = channels(file);
    [ece, kurt] = wavelet_decomposition(file);
    fs = [fs, ece, kurt];
    for col = 1: length(fs)
        features(k, col) = fs(col);
    end
end

fprintf('\n\n==========\n');
fprintf('Write features to excel file...\n');
create_csv(features)



