%Jeffa Triana Putra/13221007
% Spesifikasi Filter
Fs = 44100; % Frekuensi Sampling
Fpass1 = 250; % Frekuensi passband pertama Fstop = 4500; % Frekuensi stopband
Rp= 6;
Rs = -40;
% Kalkulasi frekuensi normalisasi
Wpass1 = Fpass1 / (Fs / 2);
Wstop = Fstop / (Fs / 2);
% Desain lowpass filter butterworth
[n, Wn] = buttord(Wpass1, Wstop, Rp, Rs); % Change filter order and stopband attenuation as needed
[b, a] = butter(n, Wn, 'low');
gain = 10^(20/20);
b = b * gain;
% Visualize frequency response of the lowpass filter freqz(b, a, 512, Fs);
% Aplikasikan lowpass filter ke audio
[y, Fs] = audioread('/Users/dzno9/Documents/MATLAB/P1_Ori_EL3010_13221007.wav'); yfilt = filter(b, a, y);
audiowrite('/Users/dzno9/Documents/MATLAB/P1_IIR1_EL3010_13221007.wav', yfilt, Fs);