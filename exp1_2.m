close all;
syms t;
syms w;
f_q=100;
f=exp(-100*t)*sin(2*pi*f_q*t)*heaviside(t);
FT=fourier(f,w);

figure(1);

subplot(2,1,1);
fplot(f,[0,0.1])
xlabel('t');
ylabel('x(t)');
title('时域波形图');

subplot(2,1,2);
fplot(abs(FT)*200,[-2000,2000]);
xlabel('频率(Hz)');
ylabel('幅度归一化');
title('幅频特性图');  

F_w=@(w)(abs(-1i./(2*(w.*1i-pi*200i+100))+1i./(2*(w.*1i +pi*200i+100)))).^2;

E=integral(F_w,-2000,2000)/(2*pi);
E_0=0.95*E;
for i=1:2000
    if(integral(F_w,-i,i)/(2*pi)>=0.95*E_0)
        break;
    end
end
i %取样频率f_s

figure(2);
f_s=[f_q,4*f_q,6*f_q,10*f_q];
for i=1:4
    T=1/f_s(i);
    n=-50:50;
    f_n=exp(-100*n*T).*sin(2*pi*f_q*n*T);

    DTFT=zeros(1,1001);
    w=0:2*pi/1000:2*pi;
    for j=1:1001
        for k=1:101
            DTFT(j)=DTFT(j)+f_n(k)*exp(-1i*w(j)*(k-51));
        end
    end

    subplot(2,2,i)
    plot(w,abs(DTFT)/max(abs(DTFT)));
    ylim([0,1]);
    xlabel('数字频率');
    ylabel('幅度归一化');
    title(['幅频特性图 f_s=' num2str(f_s(i)) 'Hz']);
end