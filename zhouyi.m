clear;%
for n = 1:6
    tianyan = 50;
    tianyan = tianyan - 1;
    for i = 1:3
        zuo = floor(tianyan*abs(rand(1)));
        you = tianyan - zuo;
        zuo = zuo - 1;
        if mod(zuo,4) == 0
            zuo_ = 4;
        else
            zuo_ = mod(zuo,4);
        end
        tianyan = tianyan - zuo_ -1;
        if mod(you,4) == 0
            you_ = 4;
        else
            you_ = mod(you,4);
        end
        tianyan = tianyan - you_;       
    end
    a(n) = (tianyan)/4;
end
pause(5)
a