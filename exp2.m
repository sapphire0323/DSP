close all;
x_n=[1,1,0,1];

DTFT=zeros(1,1001);
w=-pi:2*pi/1000:pi;
for i=1:1001
    for j=1:4
        DTFT(i)=DTFT(i)+x_n(j)*exp(-1i*w(i)*j);
    end
end

figure(1);
subplot(1,2,1);
plot(w,abs(DTFT));
ylim([0,3]);
title('幅频特性图(DTFT)');  
xlabel('数字频率');
ylabel('幅度');

figure(2);
DFT=zeros(1,4);
for k=1:4
    for n=1:4
        DFT(k)=x_n(n)*exp(-1i*pi/2*(n-1)*(k-1))+DFT(k);
    end
    hold on;
    stem(k-1,abs(DFT(k)),"filled",'r');
    title('幅频特性图(DFT)');  
    ylabel('幅度');
end

DTFT_rebuild=zeros(1,1001);
w=-pi+0.0000005:(2*pi-0.000001)/1000:pi-0.0000005;
for i=1:1001
    for k=1:4
        DTFT_rebuild(i)=DTFT_rebuild(i)+1/4*DFT(k)*(1-exp(-1i*w(i)*4))/(1-exp(1i*pi/2*(k-1))*exp(-1i*w(i)));
    end
end

figure(1);
subplot(1,2,2);
plot(w,abs(DTFT_rebuild));
ylim([0,3]);
title('幅频特性图(重建)');  
xlabel('数字频率');
ylabel('幅度');