close all
syms t;
syms w;
f_1=24;
f_2=60;
f_t=exp(1i*2*pi*f_1*t)+exp(1i*2*pi*f_2*t);
FT=fourier(f_t,w);

s=0:pi/10:150*pi;
CFT=subs(FT,w,s);
idx=(CFT==inf);
CFT(idx)=1;

figure(1);
subplot(2,2,1);
plot(s/(2*pi), abs(CFT));
title('幅频特性图(CFT)');  
xlabel('频率(Hz)');
ylabel('幅度归一化');

T0=1/12;
w0=2*pi/T0;
FS=zeros(1,10);
for m=1:10
    FS(m)=int(f_t*exp(-1j*(m-1)*w0*t),t,0,T0)/T0;
    hold on;
    subplot(2,2,2);
    stem(m-1, abs(FS(m)),'r',"filled");
    title('幅频特性图(CFS)');
    ylabel('幅度');
end

R1 = heaviside(t) - heaviside(t-2*T0);
R2 = heaviside(t) - heaviside(t-1.6*T0);
f_r1=f_t*R1;
f_r2=f_t*R2;

FT_1=fourier(f_r1, w);
subplot(2,2,3);
fplot(w/(2*pi),abs(FT_1),[0,180*pi]);
ylim([0,0.2]);
title('幅频特性图(CFT)');  
xlabel('频率(Hz)');
ylabel('幅度');

FT_2=fourier(f_r2,w);
subplot(2,2,4);
fplot(w/(2*pi),abs(FT_2),[0,180*pi]);
ylim([0,0.2]);
title('幅频特性图(CFT)');  
xlabel('频率(Hz)');
ylabel('幅度');

t_r1=0:1/120:2*T0;
t_r2=0:1/120:1.6*T0;
f_t1=exp(1i*2*pi*f_1*t_r1)+exp(1i*2*pi*f_2*t_r1);
f_t2=exp(1i*2*pi*f_1*t_r2)+exp(1i*2*pi*f_2*t_r2);

w=0:pi/250:4*pi;
DTFT_R1=zeros(1,1001);
for i=1:1001
    for k=1:21
        DTFT_R1(i)=DTFT_R1(i)+f_t1(k)*exp(-1i*w(i)*k);
    end
end

figure(2);
subplot(3,2,1);
plot(w,abs(DTFT_R1)); 
xlabel('数字频率');
ylabel('幅度');
title('DTFT R1');

DTFT_R2=zeros(1,1001);
for i=1:1001
    for k=1:17
        DTFT_R2(i)=DTFT_R2(i)+f_t2(k)*exp(-1i*w(i)*k);
    end
end

subplot(3,2,2);
plot(w,abs(DTFT_R2)); 
xlabel('数字频率');
ylabel('幅度');
title('DTFT R2');

n=0:20;
k=0:20;
DFT_w1=f_t1*(exp(-1i*2*pi/21)).^(n'*k);
subplot(3,2,3);
stem(k,abs(DFT_w1),"filled");
title('DFT R1');
ylabel('幅度');

n=0:16;
k=0:16;
DFT_w2=f_t2*(exp(-1i*2*pi/17)).^(n'*k);
subplot(3,2,4);
stem(k,abs(DFT_w2),"filled");
title('DFT R2');
ylabel('幅度');

n=0:62;
k=0:62;
zero=zeros(1,42);
f_t3=[f_t1,zero];
DFT_w3=f_t3*(exp(-1i*2*pi/63)).^(n'*k);
subplot(3,2,5);
stem(k,abs(DFT_w3),"filled");
title('DFT R1(延长)');
ylabel('幅度');

n=0:50;
k=0:50;
zero=zeros(1,34);
f_t4=[f_t2,zero];
DFT_w4=f_t4*(exp(-1i*2*pi/51)).^(n'*k);
subplot(3,2,6);
stem(k,abs(DFT_w4),"filled");
title('DFT R2(延长)');
ylabel('幅度');

t_r1=0:1/150:2*T0;
t_r2=0:1/150:1.6*T0;
f_t1=exp(1i*2*pi*f_1*t_r1)+exp(1i*2*pi*f_2*t_r1);
f_t2=exp(1i*2*pi*f_1*t_r2)+exp(1i*2*pi*f_2*t_r2);

w=0:pi/250:4*pi;
DTFT_R1=zeros(1,1001);
for i=1:1001
    for k=1:26
        DTFT_R1(i)=DTFT_R1(i)+f_t1(k)*exp(-1i*w(i)*k);
    end
end

figure(3);
subplot(3,2,1);
plot(w,abs(DTFT_R1)); 
xlabel('数字频率');
ylabel('幅度');
title('DTFT R1');

DTFT_R2=zeros(1,1001);
for i=1:1001
    for k=1:21
        DTFT_R2(i)=DTFT_R2(i)+f_t2(k)*exp(-1i*w(i)*k);
    end
end

subplot(3,2,2);
plot(w,abs(DTFT_R2)); 
xlabel('数字频率');
ylabel('幅度');
title('DTFT R2');

n=0:25;
k=0:25;
DFT_w1=f_t1*(exp(-1i*2*pi/26)).^(n'*k);
subplot(3,2,3);
stem(k,abs(DFT_w1),"filled");
title('DFT R1');
ylabel('幅度');

n=0:20;
k=0:20;
DFT_w2=f_t2*(exp(-1i*2*pi/21)).^(n'*k);
subplot(3,2,4);
stem(k,abs(DFT_w2),"filled");
title('DFT R2');
ylabel('幅度');

n=0:77;
k=0:77;
zero=zeros(1,52);
f_t3=[f_t1,zero];
DFT_w3=f_t3*(exp(-1i*2*pi/78)).^(n'*k);
subplot(3,2,5);
stem(k,abs(DFT_w3),"filled");
title('DFT R1(延长)');
ylabel('幅度');

n=0:62;
k=0:62;
zero=zeros(1,42);
f_t4=[f_t2,zero];
DFT_w4=f_t4*(exp(-1i*2*pi/63)).^(n'*k);
subplot(3,2,6);
stem(k,abs(DFT_w4),"filled");
title('DFT R2(延长)');
ylabel('幅度');