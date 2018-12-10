Num1 = load('bp3000-3500.mat','Num');
bp = Num1.Num;
fs=48000;
%t=0:1/fs:(128-1)/fs;
%mx= sin(2*pi*100*t) + sin(2*pi*400*t);
%ct= sin(2*pi*3000*t);
 
%subplot(1,2,1);
%stem(mt);
%ylabel('m');
%xlabel('t');
%subplot(1,2,2);
%stem(ct);
%ylabel('c');
%xlabel('t');

n = 0:1023;
mt = sin(2*pi*100*n/fs) + sin(2*pi*400*n/fs);
ct = sin(2*pi*3000*n/fs);
dsb = mt.*ct;
vsb=filter(bp,1,dsb);
%
k = -1023:1023; 
w = (pi/1023)*k;  % frequency between -pi and +pi

Mt = mt*(exp(-1i*pi/1023)).^(n'*k);  % DTFT of mt
Ct = ct*(exp(-1i*pi/1023)).^(n'*k);  % DTFT of ct
DSB = dsb*(exp(-1i*pi/1023)).^(n'*k);  % DTFT of dsb
VSB = vsb*(exp(-1i*pi/1023)).^(n'*k);  % DTFT of vsb

% Graphical verification
subplot(2,2,1); plot(w*fs/(2*pi),abs(Mt)); grid; 
xlabel('frequency'); ylabel('|Mt|');
title('Magnitude of Mt');
axis([0 4000 0 600])

subplot(2,2,3); plot(w*fs/(2*pi),abs(Ct)); grid;
xlabel('frequency'); ylabel('|Ct|');
title('Magnitude of Ct');
axis([0 4000 0 600])

subplot(2,2,2); plot(w*fs/(2*pi),abs(DSB)); grid;
xlabel('frequency'); ylabel('|DSB|');
title('Magnitude of DSB');
axis([0 4000 0 300])

subplot(2,2,4); plot(w*fs/(2*pi),abs(VSB)); grid;
xlabel('frequency'); ylabel('|VSB|');
title('Magnitude of VSB');
axis([0 4000 0 200])
 