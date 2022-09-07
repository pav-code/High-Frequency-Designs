clear all;
close all;
clc;



w = 0.001:0.01:1000;
C = 0.001;
Zc = 50;
Z0 = 50*exp(-1j*w);
gamma = (Zc - Z0)./(Zc + Z0);

% Draw appropriate chart
draw_smith_chart 
m = abs(gamma);
th = angle(gamma); 
polar(th, m, 'b*') 



R = 73;
L = 3.81*10^-9;
Z0 = 50;

f = (0.9:0.1:3.6) * 10^9;

%========= PART A, B =============
Zl = R + 1j*L*2*pi*f;
gamma = (Zl - Z0)./(Zl + Z0);

% Draw appropriate chart
draw_smith_chart 
m = abs(gamma);
th = angle(gamma); 

% Plot appropriate point
polar(th, m, 'r*') 

RL = -20*log10(abs(gamma));

SWR = (1 + abs(gamma))./(1 - abs(gamma));

figure
plot(f,RL)
xlabel('frequency [Hz]')
ylabel('Return Loss [dB]')
title(' RL VS Frequency, part B ')

figure
plot(f,SWR)
xlabel('frequency [Hz]')
ylabel('VSWR x:1 [dB]')
title(' VSWR VS Frequency, Part B ')


%=========== PART C ==============
C = 0.5*10^-12;
w = 2*pi*f;
c0 = 3*10^8;
Be = (2*pi*f)/c0;
l = 0.0417;
Z0 = 70;

Zl = (R + 1j*w*L)./(1 + 1j*w*C*R - w.^2*C*L);

Zin = Z0.* (Zl + 1j*Z0*tan(Be*l))./(Z0 + 1j*Zl.*tan(Be*l));

gamma = (Zin - 50)./(Zin + 50);

figure;
% Draw appropriate chart
draw_smith_chart
m = abs(gamma);
th = angle(gamma); 

% Plot appropriate point
polar(th, m, 'r*') 
RL = -20*log10(abs(gamma))

SWR = (1 + abs(gamma))./(1 - abs(gamma))

figure
plot(f,RL)
xlabel('frequency [Hz]')
ylabel('Return Loss [dB]')
title(' RL VS Frequency, part C ')

figure
plot(f,SWR)
xlabel('frequency [Hz]')
ylabel('VSWR x:1 [dB]')
title(' VSWR VS Frequency, Part C ')
