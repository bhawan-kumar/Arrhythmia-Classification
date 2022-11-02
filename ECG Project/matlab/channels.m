function [median_features] = channels(file)

hrv_avg = zeros(1, 12);
features = zeros(12, 16);
median_features = zeros(1, 17);

for ind = 1:12
    col_data = file{:, ind};
    [hrv, R_t, ~, ~, ~, ~]  = rpeakdetect(col_data,256,0.2);

    % Extract HRV, Time-domain, and Frequency-domain features
    hrv_avg(ind) = mean(hrv);
    [sdsd, sdnn, rmssd, pnn50, tinn, hti, apen, sd1, sd2, sdratio]= extract.time_domain_features(R_t, 0);
    [pLF,pHF,LFHFratio,VLF,LF,HF] = extract.freq_domain_features(R_t, 0);

    fs = [sdsd, sdnn, rmssd, pnn50, tinn, hti, apen, sd1, sd2, sdratio, pLF,pHF,LFHFratio,VLF,LF,HF];
    for col = 1: length(fs)
        features(ind, col) = fs(col);
    end
end

median_features(1) = median(hrv_avg);
for col = 1: 16
    feature = features(:, col);
    median_features(col+1) = median(feature);
end



