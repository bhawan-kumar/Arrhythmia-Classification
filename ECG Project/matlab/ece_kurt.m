function [ece, kurt] = ece_kurt(DEC,L,N,M)
ece = zeros(1, 12);
ku = zeros(1, 12);

for i = 1:M
    [Ea(i), Ed(i,1:N)] = wenergy(DEC(:,i),L);
    ECE(i,1:N+1) = [Ed(i,1:N) Ea(i)];
    ece(1, i) = median(ECE(i));
end

for i = 1:M
    m = 0;
    k = 1;
    for j = 1:N+1
        kurt(i,j) = kurtosis(DEC(k:m+L(j),i));
        m = L(j);
        k = k+L(j);
    end
    ku(1, i) = median(kurt(i, :));
end

kurt = ku;


