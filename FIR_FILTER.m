%Jeffa Triana Putra/13221007
% Spesifikasi Filter
Fs = 44100; % Frekuensi Sampling
Fpass1 = 200; % Frekuensi passband pertama
Fband1=250; %Frekuensi band
Fband2=3500; %Frekuensi band
Fstop2 = 4000; % Frekuensi stopband sebelum passband ke dua
Apass1 = 10^(20/20); % Penguatan passband skala linear (< 250 Hz) Aband1=10^(0/20); %Supaya penguatan pada band bernilai 0
Aband2=10^(0/20); %Supaya penguatan pada band bernilai 0
Astop2 = 10^(-10/20); % Pengurangan penguatan stopband skala linear (> 3500 Hz)
%Orde filter
filterOrder = 128; % Semakin tinggi orde semakin presisi hasilnya
% Perhitungan frekuensi berdasarkan spesifikasi Wpass1 = Fpass1 / (Fs / 2);
Wband1= Fband1/ (Fs/2);
Wband2=Fband2/ (Fs/2);
Wstop2 = Fstop2 / (Fs / 2);
% Desain filter (firls)
b = firls(filterOrder, [0, Wpass1, Wband1, Wband2, Wstop2, 1], [Apass1, Apass1, Aband1, Aband2, Astop2, Astop2]);
% Visualisasi respons frekuensi filter freqz(b, 1, 512, Fs);
% Aplikasi filter ke audio audio
[y, Fs] = audioread('/Users/dzno9/Documents/MATLAB/P1_Ori_EL3010_13221007.wav'); yfilt = filter(b, 1, y);
audiowrite('/Users/dzno9/Documents/MATLAB/FirFix128.wav', yfilt, Fs);