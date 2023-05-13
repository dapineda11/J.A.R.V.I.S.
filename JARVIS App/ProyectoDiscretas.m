close all
clear all



Fs = 44100;
t = 3;
v = audiorecorder(Fs, 16, 1);
v.StartFcn = 'disp(''   iniciando grabación'')';
v.StopFcn = 'disp(''   terminando grabación'')';

input ('Grabe su voz durante 2 segundos (Luego de presionar la tecla "ENTER")'); 
recordblocking(v, t)
y = v.getaudiodata()
audiowrite ('test1.wav',y,Fs); 
sound(y, Fs)

s = audioread('test1.wav')
norms = s/norm(s) ;
sfft = abs(fft(norms));
sv=sfft/sqrt(sum(abs(sfft).^2));



%%
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


disp('Coeficiente de Error  Uno:')
error(1) = mean(abs(sv-cv));
disp(error(1))
disp('Correlacion de Error  Convolución Circular:')
error(2) = mean(abs(sv-bv));
disp(error(2))
disp('Correlacion de Error  Región de convergencia:')
error(3) = mean(abs(sv-lv));
disp(error(3))
disp('Correlacion de Error  Abrir Ventana:')
error(4) = mean(abs(sv-av));
disp(error(4))
disp('Correlacion de Error  Tocar el Piano:')
error(5) = mean(abs(sv-nv));
disp(error(5))

min_error = min(error);

switch min_error
    case error(1) 
        disp('Coincidencia con comando:UNO ')
    case error(2)
        disp('Coincidencia con comando: CONVOLUCIÓN CIRCULAR')
    case error(3)
        disp('Coincidencia con comando: REGIÓN DE CONVERGENCIA')
    case error(4)
        disp('Coincidencia con comando: ABRIR VENTANA')
    case error(5)
        disp('Coincidencia con comando: TOCAR EL PIANO')
end



subplot(2,5,1),stem(s); %relacion de posicion de la grafica%
title ('Grabacion 1')
subplot(2,5,2),plot(sv); % Espectro de la grabacion 1 
title ('Espectro de la grabacion 1')

 subplot(2,5,6),plot(cv); % espectro de la grabacion c 
 title ('Grabacion UNO')
 subplot(2,5,7),plot(bv); % espectro de la grabacion p 
 title ('Grabacion CONVOLUCIÓN CIRCULAR')
 subplot(2,5,8),plot(lv); % espectro de la grabacion l 
 title ('Grabacion REGIÓN DE CONVERGENCIA')
 subplot(2,5,9),plot(av); % espectro de la grabacion a 
 title ('Grabacion ABRIR VENTANA');
 subplot(2,5,10),plot(nv); % espectro de la grabacion n 
 title ('Grabacion TOCAR EL PIANO');
 
 
 
  subplot(2,5,6),plot(c); % espectro de la grabacion c 
 title ('Espectro UNO')
 subplot(2,5,7),plot(b); % espectro de la grabacion p 
 title ('Espectro CONVOLUCIÓN CIRCULAR')
 subplot(2,5,8),plot(l); % espectro de la grabacion l 
 title ('Espectro REGIÓN DE CONVERGENCIA')
 subplot(2,5,9),plot(a); % espectro de la grabacion a 
 title ('Espectro ABRIR VENTANA');
 subplot(2,5,10),plot(n); % espectro de la grabacion n 
 title ('Espectro TOCAR EL PIANO');
 