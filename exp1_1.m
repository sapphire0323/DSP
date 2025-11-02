close all
syms t;
syms w;
f_h=10;
f=sin(2*pi*f_h*t)/t;
FT=fourier(f,2*pi*w);

figure(1);

subplot(2,1,1);
fplot(f,[-5,5])
xlabel('t');
ylabel('x(t)');
title('时域波形图');

subplot(2,1,2);
fplot(abs(FT)/pi,[-120,120]);
xlabel('频率(Hz)');
ylabel('幅度归一化');
title('幅频特性图');

figure(2);
f_s=[0.3*f_h,0.6*f_h,1.2*f_h,1.8*f_h,2.4*f_h];
for i=1:5
    T=1/f_s(i);
    n=-50:50;
    f_n=sin(2*pi*f_h*n*T)./(n*T);
    f_n(n==0)=2*pi*f_h;
    
    DTFT=zeros(1,1001);
    w=-pi:2*pi/1000:pi;
    for j=1:1001
        for k=1:101
            DTFT(j)=DTFT(j)+f_n(k)*exp(-1i*w(j)*(k-51));
        end
    end

    subplot(2,3,i);
    plot(w,abs(DTFT)/max(abs(DTFT)));
    ylim([0,1]);
    xlabel('数字频率');
    ylabel('幅度归一化');
    title(['幅频特性图 f_s=' num2str(f_s(i)) 'Hz']);
end