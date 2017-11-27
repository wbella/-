p(1,1) = 1, c(1,1) = 00;p(1,2) = 2, c(1,2) = 11;
p(2,1) = 3, c(2,1) = 10;p(2,2) = 4, c(2,2) = 01;
p(3,1) = 1, c(3,1) = 11;p(3,2) = 2, c(3,2) = 00;
p(4,1) = 3, c(4,1) = 01;p(4,2) = 4, c(4,2) = 10;
c = [0,0,1,1;1,0,0,1;1,1,0,0;0,1,1,0]
PM = [0,Inf,Inf,Inf];
S = zeros(4,8);
S1 = zeros(4,8);
for n = 1:length(x2)/2
    v = x2(1,2*n-1:2*n);
    for i = 1:4
        for j = 1:2
            BM(i,j) = (c(i,2*j-1) - v(1))^2 + (c(i,2*j) - v(2))^2;
        end
    end
    for i = 1:4
        if PM(p(i,1))+BM(i,1)<PM(p(i,2))+BM(i,2)
            J(i)=1;
        else
            J(i)=2;
        end
        PM1(i) = PM(p(i,J(i)))+BM(i,J(i));
    end
    PM = PM1;
    for i = 1:4
        S1(i,:) = S(p(i,J(i)),:);
    end
    S = S1;
    m = min(PM);
    f = find(PM==m(1));
    L(1,2*n - 1:2*n) = S(f(1),1:2);
    for i=1:4
        S(i,1:6) = S(i,3:8);
        S(i,7:8) = c(i,2*J(i) - 1:2*J(i));
    end
end

