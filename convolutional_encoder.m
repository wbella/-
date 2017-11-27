function [coder_output] = convolutional_encoder(s,G,n)
%s input data stream [s(n) s(n+1) ...]';
%G Generating polynomial
%Code Rate is 1/n

G = flipud(G);
N = length(s);
[L n1] = size(G);
if(n1~=n) error('The matrix G is not of right dimension'); end;

shift_register = zeros(L,1);
for k = 1:N
    shift_register(L) = s(k);
    for k1 = 1:n
        x(k1,k) = mod(sum(shift_register.*G(:,k1)),2);
    end;
    
    shift_register(1:L-1) = shift_register(2:L);
end;

coder_output = x(:);
