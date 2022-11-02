classdef extract
    properties
    end
    
    methods(Static)
        function [sdsd, sdnn, rmssd, pnn50, tinn, hti, apen, sd1, sd2, sdratio] = time_domain_features(RR, num)
            sdsd = HRV.SDSD(RR, num);
            sdnn = HRV.SDNN(RR, num);
            rmssd = HRV.RMSSD(RR, num);
            pnn50 = HRV.pNN50(RR, num);
            [hti, tinn] = HRV.triangular_val(RR, num);
            apen = HRV.ApEn(RR, num);
            [sd1, sd2, sdratio] = HRV.returnmap_val(RR, num);
        end

        function [pLF,pHF,LFHFratio,VLF,LF,HF] = freq_domain_features(RR, num)
            [pLF,pHF,LFHFratio,VLF,LF,HF] = HRV.fft_val(RR, num, 1000);
        end
    end
end

