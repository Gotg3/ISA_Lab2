clc
clear all
close all
%% OPTIMIZE_REG
n_pipe=[0,1,2,3,4,5,6]
f_opt=[632.91,1111.11,1149.43,1265.82,1111.11,1250,1250]; %MHz


%% ULTRA
f_ultra=[632.91,588.24,561.80,636.94,588.24,689.66,595.24];

%% PLOT
latency=[5,6,7,8,9,10,11]
figure('Name', 'Freq comparison');
plot(n_pipe,f_opt,'--o');
hold on
grid on
plot(n_pipe,f_ultra,'--o');
xticks(n_pipe);
hold off
xlabel('N° of pipe stage');
yyaxis left
ylabel('Frequency [MHz]');

yyaxis right 
plot(n_pipe,latency,'--x')
ylabel('Latency [Ck cycles]');
 set(gca,'YColor','k');
legend('Optimize\_registers Freq.','Compile\_ultra Freq.','Additional Latency');
%saveas(gcf,'freq_comp.png')