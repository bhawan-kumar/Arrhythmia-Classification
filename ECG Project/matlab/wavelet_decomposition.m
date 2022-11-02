function [ece, kurt] = wavelet_decomposition(file)
    % Wavelet Decomposition
    N = floor(log2(500)-2.96);
    wname = 'bior4.4';
    [RF,DF] = biorwavf(wname);
    [LO_D,HI_D,~,~] = biorfilt(DF,RF);
    % [LO_D,HI_D,LO_R,HI_R] = wfilters(wname);
    % tic
    for i = 1:12
        [DEC(:,i),L] = wavedec(file{:,i}, N, LO_D, HI_D);
    end
    % toc
    L = L';
    
    [ece, kurt] = ece_kurt(DEC, L, N, 12);
end



