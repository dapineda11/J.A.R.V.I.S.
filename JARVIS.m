clc

close all

clear all

Fs = 44100;

t = 3;

v = audiorecorder(Fs, 16, 1);

input ('Grabe su voz durante 3 segundos (Luego de presionar la tecla "ENTER")');

recordblocking(v, t) % Grabar durante 3 segundos

y = v.getaudiodata() % Conversion de audio en un arreglo

audiowrite ('test1.wav',y,Fs);

sound(y, Fs)

s = audioread('test1.wav') % Lectura del audio

norms = s/norm(s) ; % Normalizacion de la señal

sfft = abs(fft(norms));

sv=sfft/sqrt(sum(abs(sfft).^2));

%% Base de Audios

c = audioread('comando1.wav');

b = audioread('comando2.wav');

l = audioread('comando3.wav');

a = audioread('comando4.wav');

n = audioread('comando5.wav');

c = audioread('comando1.wav')

normc = c/norm(c) ;

cfft = abs(fft(normc));

cv=cfft/sqrt(sum(abs(cfft).^2));

b = audioread('comando2.wav')

normb = b/norm(b) ;

bfft = abs(fft(normb));

bv=bfft/sqrt(sum(abs(bfft).^2));

l = audioread('comando3.wav');

norml = l/norm(l) ;

lfft = abs(fft(norml));

lv=lfft/sqrt(sum(abs(lfft).^2));

a = audioread('comando4.wav')

norma = a/norm(a) ;

afft = abs(fft(norma));

av=afft/sqrt(sum(abs(afft).^2));

n = audioread('comando5.wav')

normn = n/norm(n) ;

nfft = abs(fft(normn));

nv=nfft/sqrt(sum(abs(nfft).^2));

disp('Coeficiente de Error Alcance:')

error(1) = mean(abs(sv-cv));

disp(error(1))

disp('Correlacion de Error Altitud:')

error(2) = mean(abs(sv-bv));

disp(error(2))

disp('Correlacion de Error Disparar:')

error(3) = mean(abs(sv-lv));

disp(error(3))

disp('Correlacion de Error Jarvis:')

error(4) = mean(abs(sv-av));

disp(error(4))

disp('Correlacion de Error Energía:')

error(5) = mean(abs(sv-nv));

disp(error(5))

min_error = min(error);

rta1 = audioread('rta1.wav');

rta2 = audioread('rta2.wav');

rta3 = audioread('rta3.wav');

rta4 = audioread('rta4.wav');

rta5 = audioread('rta5.wav');

switch min_error

case error(1)

disp('Coincidencia con comando:Alcance ')

sound(rta1,Fs)

case error(2)

disp('Coincidencia con comando: Altitud')

sound(rta2,Fs)

case error(3)

disp('Coincidencia con comando: Disparar ')

sound(rta3,Fs)

case error(4)

disp('Coincidencia con comando: Jarvis')

sound(rta4,Fs)

case error(5)

disp('Coincidencia con comando: Energía')

sound(rta5,Fs)

end

subplot(2,5,1),stem(s); %relacion de posicion de la grafica%

title ('Grabacion 1')

subplot(2,5,2),plot(sv); % Espectro de la grabacion 1

title ('Espectro de la grabacion 1')

subplot(2,5,6),plot(cv); % espectro de la grabacion c

title ('Grabacion Alcance')

subplot(2,5,7),plot(bv); % espectro de la grabacion p

title ('Grabacion Altitud')

subplot(2,5,8),plot(lv); % espectro de la grabacion l

title ('Grabacion Disparar')

subplot(2,5,9),plot(av); % espectro de la grabacion a

title ('Grabacion Jarvis');

subplot(2,5,10),plot(nv); % espectro de la grabacion n

title ('Grabacion Energía');

subplot(2,5,6),plot(c); % espectro de la grabacion c

title ('Espectro Alcance')

subplot(2,5,7),plot(b); % espectro de la grabacion p

title ('Espectro Altitud')

subplot(2,5,8),plot(l); % espectro de la grabacion l

title ('Espectro Disparar')

subplot(2,5,9),plot(a); % espectro de la grabacion a

title ('Espectro JARVIS');

subplot(2,5,10),plot(n); % espectro de la grabacion n

title ('Espectro Energía');