%% 

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % Experiments
%% 
clear
clear all
% % % % % % % % % % % % % % % % % % % % % % % % % % Problem 4.1 Magic Matrices
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


M = magic(5)

sum(M)
sum(M')
% S = sum(A,dim) returns the sum along dimension dim. For example, if A is a matrix, 
% then sum(A,2) is a column vector containing the sum of each row.
% sum(M1,2)
% sum(M2,2)
% sum(M3,2)

 for row = 1:5
    for column = 1:5
        if row == 1
            R1(column) = M(row,column);
        end
        
        if column == 3
            C3(row) = M(row, column);
        end
        
        if (row >= 2) && (column <=3)
            M_sub(row-1,column) = M(row,column); 
        end
   
    end
 end
 
 fprintf('The first row is: ');
 R1
 fprintf('The third column is: ');
 C3'
 fprintf('Column 1 to 3 of rows2 to the end of M: ');
 M_sub
 
 

for row = 1:5
    for column = 1:5
        if M(row,column) > 10
            fprintf('M(%d, %d) = %d > 10 \n',row,column, M(row,column))
        end
    end
end

for row = 1:5
    for column = 1:5
        if M(row,column) < 4
            fprintf('M(%d, %d) = %d < 4 \n',row,column, M(row,column))
        end
    end
end


%% 

clear
clear all
% % % % % % % % % % % % % % % % % % % % % % % % Problem 4.2 Fibonacci Numbers
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
x = 12;
n = 1:12;
y = fibonacci(x);
figure
subplot(3,1,1)
plot(n,y(n));
for n = 2:12
    ratio(n) = y(n)/y(n-1);
end
ratio(1) = 1;
x2 = 0:0.1:12;
y2 = (sqrt(5)+1)/2;
subplot(3,1,2)
plot(ratio,'r--*')
hold on             % hold on
plot(x2,y2,'g-.o');


%% 

clear
clear all
% % % % % % % % % % % % % % % % % % % % % Problem 4.3 Statistical Measurements
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% % rand --Uniformlly distributed random numbers on the interval (0,1);
% % randn--Normally distributed random numbers having zero mean and
% variance one

x = rand(1000,1);
Min_x  = min(x);
Max_x  = max(x);
Mean_x = mean(x);
Std_x  = std(x);

y = 4*x-2;
Mean_y = mean(y);
Std_y  = std(y);
xn = randn(1000,1);
Min_xn = min(xn);
Max_xn = max(xn);
Mean_xn= mean(xn);
Std_xn = std(xn);
nbins = 100;
hist(xn,nbins);
%% 

clear
clear all
% % % % % % % % % % % % % % % % % % % % % Problem 4.4 An Optimization Example
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

% %     A(r,h) = 2*pi*r^2 + 2*pi*h
% %     V(r,h) = pi*r^2*h
% %     A(r)   = 2*pi*r^2 + 2*V/r
V = 330;

r = 0.5:0.01:10;
A = 2*pi*r.^2+2*V./r;
plot(r,A,'g:');
hold on;
min(A)
a = find(A==min(A))
plot(r(a),min(A),'r--*');
r(a)
h = V/(pi*r(a)^2)

%% 
clear
clear all
% % % % % % % % % % % % % % % % % % % % % % % % Problem 4.5 The Moving Average
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
load glob_warm.mat
x_head = zeros(158,1);
x_head = moving_average(158,3);
plot(x_head,'r-');
xlabel('Year/y');
ylabel('Temperature/C');
hold on
plot(moving_average(158,7),'b*')
hold on
plot(moving_average(158,20),'c--o')
plot(Ta,'g--');
legend('m = 3','m = 7','m = 20','Original')
%% 
clear
clear all
% % % % % % % % % % % % % % % % % % % % Problem 4.6 A Signal Processing Example
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% %  n  --   discrete time vector
% %  F  --   'continous-time frequency' in Hz
% %  T  --   sampling time in seconds
% %  s  --   original signal
% %  S  --   FFT of the original signal s
% %  P  --   specturm of the signal s
% %  w  --   normalized frequency vector
% %  s2 --   distrubanced signal with 4Hz
% %  b  --   numerator coefficient of a digital filter
% %  a  --   denominator coefficients of a digital filter
% %  sf --   signal after filter
% %  
n = 0:100;
F = 1;
T = 0.05;
s = sin(2*pi*F*n*T);
figure 
subplot(3,1,1);
plot(n,s);
xlabel(' n ');
ylabel(' sin(2*pi*f*n*T) ');
title('discrete-time Signal');

subplot(3,1,2);
plot(n*T,s)
xlabel(' nT ');
ylabel(' sin(2*pi*f*nT) ');
title('sampled signal');

subplot(3,1,3);
stem(n,s);
xlabel(' n ');
ylabel(' sin(2*pi*f*n*T) ');
title('stem signal');


S = fft(s,128);
P = S.*conj(S);
w = (0:127)/128;
figure
subplot(3,1,1);
plot(2*w,P);
xlabel('[rad/sample]');
ylabel(' [voltage/V] ');
title('Power Spectrum');

subplot(3,1,2);
plot(w/T,P);
xlabel('[Frequency/Hz]');
ylabel(' [voltage/V] ');

s2 = s + sin(2*pi*4*n*T);
subplot(3,1,3);
plot(n,s2);
xlabel('[/n]');
ylabel(' [voltage/v] ')

b = [1 1 1 1]/4;
a = 1;
[H,W1] = freqz(b,a);

figure
subplot(3,1,1);
plot(W1/(2*pi*T),abs(H));
sf = filter(b,a,s2);

subplot(3,1,2);
plot(sf);
xlabel('[/n]');
ylabel(' [voltage/v] ');

SF   = fft(sf,128);
P_SF = SF.*conj(SF);
subplot(3,1,3);
plot(2*w,P_SF);
xlabel('[rad/sample]');
ylabel(' Power Spectrum');





















