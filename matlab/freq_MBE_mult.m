clc
clear all
close all
%% OPTIMIZE_REG
n_pipe=[1,2,3,4,5,6]
f_opt_MBE=[1111.11,1052.63,1136.36,1136.36,1250,1123.60]; %MHz


%% ULTRA
f_ultra_MBE=[568.18,591.72,591.72,558.66,598.80,571.43];

%% PLOT
latency=[6,7,8,9,10,11]
figure('Name', 'Freq comparison');
plot(n_pipe,f_opt_MBE,'--o');
hold on
grid on
plot(n_pipe,f_ultra_MBE,'--o');
xticks(n_pipe);
hold off
xlabel('N° of pipe stage');
ylabel('Freq. [MHz]');

yyaxis right 
plot(n_pipe,latency,'--x')
ylabel('Latency [Ck cycles]');
yticks(latency);
 set(gca,'YColor','k');
legend('Optimize\_registers\_MBE Freq.','Compile\_ultra\_MBE Freq.','Additional Latency');
%saveas(gcf,'freq_comp_MBE.png')
%% MBE vs mult
f_opt_mult=[1111.11,1149.43,1265.82,1111.11,1250,1250]; %MHz
f_ultra_mult=[588.24,561.80,636.94,588.24,689.66,595.24];

figure('Name', 'Freq_MBE vs Freq_mult')
plot(n_pipe,f_opt_MBE,'--o');
hold on
grid on
plot(n_pipe,f_opt_mult,'--x');
hold on 
plot(n_pipe,f_ultra_MBE,'--o');
hold on 
plot(n_pipe,f_ultra_mult,'--x');
xticks(n_pipe);
hold off
xlabel('N° of pipe stage');
ylabel('Freq. [MHz]');
legend('Optimize\_registers\_MBE Freq.','Optimize\_registers\_mult Freq.','Compile\_ultra\_MBE Freq.','Compile\_ultra\_mult Freq.');