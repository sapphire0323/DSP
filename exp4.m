close all       

N=16;  
L=log2(N);
n=0:N-1;          
k=0:N-1;          
x_n=2*sin(pi/4*n)+sin(5*pi/8*n)+3*sin(3*pi/4*n);
DFT=x_n*(exp(-1i*2*pi/N)).^(n'*k); 

subplot(2,1,1);     
stem(k,abs(DFT),"filled"); 
title('16点DFT');
ylabel('幅度');
       
r=zeros(1,N);    
x_m=zeros(L+1,N);
x_m(1,:)=x_n;

for j=1:L
    signal=(bitget(k,L-j+1));  
    r=mod(bitrevorder(k),(2^(j-1)));      
    x_m(j+1,:)=(x_m(j,:)+(circshift(x_m(j,:),-2^(L-j))).*exp(-1i*2*pi/(2^j)*r)).*(1-signal)...
    +((circshift(x_m(j,:),2^(L-j))-x_m(j,:).*exp(-1i*2*pi/(2^j)*r)).*signal);
end

x_m(L+1,:)      
FFT=x_m(L+1,bitrevorder(k)+1);

subplot(2,1,2);     
stem(k,abs(FFT),"filled"); 
title('16点FFT');   
ylabel('幅度');