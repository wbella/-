clear;
N = 200;
noisevariance = 0.3;
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








