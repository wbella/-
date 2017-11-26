clear;
N = 200;
noisevariance = 0;
G = [[1 1 1]' [1 0 1]'];
[FLUSHBits n] = size(G);

s = (rand(N,1)>0.5);
s = [s;zeros(FLUSHBits,1)];

coder_output = convolutional_encoder(s,G,n);

x1 = (2*coder_output - 1) + sqrt(noisevariance)*randn(length(coder_output),1);
x2 = x1>0;

%decodedsignal = convolutional_decoder(x2,G,n);

sum(coder_output~=(x2'>0)')
%sum(decodedsignal~=s)


x2=x2';








S = zeros(1,2);
T = zeros(4,4);
T = [0 0 1 1; 1 1 0 0; 1 0 0 1; 0 1 1 0];
S_now = zeros(1,2);
for i = 1:length(x2)/2
i;
S_now;
v = x2(1,2*i-1:2*i);
k = S_now(1)*2 + S_now(2) + 1;
Tk = T(k,:);
(Tk(1) - v(1))^2 + (Tk(2) - v(2))^2;
(Tk(3) - v(1))^2 + (Tk(4) - v(2))^2;
if (Tk(1) - v(1))^2 + (Tk(2) - v(2))^2 < (Tk(3) - v(1))^2 + (Tk(4) - v(2))^2
    de(i) = 0;
else
    de(i) = 1;
end
de(i);
S_now(2) = S_now(1);
S_now(1) = de(i);
end

sum(de'~=s)