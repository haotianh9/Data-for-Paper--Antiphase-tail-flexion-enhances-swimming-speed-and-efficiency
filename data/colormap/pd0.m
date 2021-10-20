clc;
clear all;
close all;
Ux=[4.3994	4.3994	4.3994	4.3994	4.3994	4.3994	4.3994
4.7714	4.7299	4.7238	4.7038	4.6250	4.5271	4.3994
5.0546	4.9885	4.9875	5.0225	4.8981	4.6079	4.3994
5.1977	5.1328	5.1731	5.3028	5.1702	4.6956	4.3994
5.2104	5.1661	5.2705	5.5173	5.4090	4.7779	4.3994
5.0784	5.0847	5.2796	5.6570	5.5978	4.8450	4.3994
4.8286	4.8685	5.1949	5.7186	5.6556	4.8904	4.3994
4.5694	4.6398	4.9969	5.6979	5.6675	4.9094	4.3994
4.1112	4.2781	4.7106	5.5865	5.6707	4.8983	4.3994
3.6621	3.7817	4.4697	5.3642	5.6368	4.8546	4.3994
3.3273	3.3427	4.0537	5.0414	5.5950	4.7759	4.3994
2.7758	2.6279	3.1609	4.6601	5.3666	4.6599	4.3994
2.4248	2.4783	2.5912	4.1632	5.0342	4.5030	4.3994]

W_input=[98.2710	98.2710	98.2710	98.2710	98.2710	98.2710	98.2710
180.3324	167.1937	154.2231	141.8431	126.1694	113.2011	98.2710
294.7082	263.1508	229.5323	193.0963	161.7066	129.4872	98.2710
444.7762	380.6746	324.3431	262.9329	205.6642	147.0268	98.2710
637.7649	527.5436	432.7502	345.2700	251.5629	164.7477	98.2710
859.2490	701.1931	560.9864	440.6057	306.0214	188.4028	98.2710
1.1537E+03	908.1891	709.3964	542.0164	366.1173	211.0094	98.2710
1200	1000	880.6093	658.9355	431.0099	233.6851	98.2710
1700	1300	1.0698E+03	776.6302	496.9146	257.3243	98.2710
2300	1700	1300	902.8895	566.3605	280.7445	98.2710
3000	2300	1700	1.0442E+03	634.1835	305.0460	98.2710
3500	3000	2300	1200	701.6775	324.6860	98.2710
5000	3500	3000	1500	774.8385	342.4579	98.2710]

ufar=0;

Ux_normalize=4.3994;
W_in_nomalize=98.2710;
efficient_normalize=Ux_normalize^2/W_in_nomalize;
cot_normalize=W_in_nomalize/Ux_normalize;
cot=W_input./Ux;
efficient=Ux.^2./W_input/1;

Amp=[0
    5
    10
    15
20
25
30
35
40
45
50
55
60];
k=[	0.4	0.5	0.6	0.7	0.8	0.9 1.0];


sz=99;
[Amp,k]=meshgrid(Amp,k);
Amp=Amp';
k=k';




figure
sz=99;
pq=1;
for i=1:length(Amp(:,1))
    for j=1:length(Amp(1,:))
        x1(pq)=k(i,j);
        y1(pq)=Amp(i,j);
        a1(pq)=Ux(i,j)/Ux_normalize;
        pq=pq+1;
    end
end
% pcolor(Amp,k,Ux./Ux_normalize);
scatter(x1,y1,sz,a1,'s','filled')
colormap autumn
% colorbar
% shading interp
hold on
% v=[70 90];
% contourf(100*Ux/max(max(Ux)),v,'-k')
% hold on
v= [1.0 1.1 1.2];
[C,h] =contour(k,Amp,Ux./Ux_normalize,v,'-k')
clabel(C,h,'FontSize',15,'Color','k','FontName','Times New Roman')
axis([0.3,1.1,-5,65]);
yticks([0:10:60])
xticks([0.4:0.1:1.0])
caxis([0.5 3])
ax = gca;
ax.FontSize = 19;
% xl=xlabel('$A_2$','Interpreter','latex','Rotation',0,'Fontsize',24);
% yl=ylabel('$l_1/(l_1+l_2)$','Interpreter','latex','Rotation',90,'Fontsize',24);
% title('Velocity','Interpreter','latex','Rotation',0,'Fontsize',24)
% colorbar
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);

print -depsc Ux_pd0.0.eps
% 
hold off

% 
% 
% figure
% pcolor(Amp,k,W_input/W_in_nomalize)
% hold on
% v= [1 5 9];
% [C,h] =contour(Amp,k,W_input/W_in_nomalize,v,'-k')
% clabel(C,h,'FontSize',15,'Color','k','FontName','Times New Roman')
% cmap=parula(1000);
% caxis([0.5 12])
% shading interp
% axis([0,60,0.4,1.0]);
% xticks([0:10:60])
% yticks([0.4:0.1:1.0])
% ax = gca;
% ax.FontSize = 19;
% % xl=xlabel('$A_2$','Interpreter','latex','Rotation',0,'Fontsize',24);
% % yl=ylabel('$l_1/(l_1+l_2)$','Interpreter','latex','Rotation',90,'Fontsize',24);
% % title('Power input','Interpreter','latex','Rotation',0,'Fontsize',24)
% % colorbar
% set(gca,'XTickLabel',[]);
% set(gca,'YTickLabel',[]);
% print -depsc W_in_normalized_by_simple_plate_self_propulsion.eps
% hold off
% % 
% % 
% % 
% 
figure
% pcolor(Amp,k,efficient/efficient_normalize,cmap='winter');
sz=99;
pq=1;
for i=1:length(Amp(:,1))
    for j=1:length(Amp(1,:))
        x1(pq)=k(i,j);
        y1(pq)=Amp(i,j);
        a1(pq)=Ux(i,j)/Ux_normalize;
        pq=pq+1;
    end
end
scatter(x1,y1,sz,a1,'s','filled')
colormap winter
hold on
caxis([0.5 7])
v= [1.0 0.5 ];
[C,h] =contour(k,Amp,efficient/efficient_normalize,v,'-k')
clabel(C,h,'FontSize',15,'Color','k','FontName','Times New Roman')
% v=[70 90];
% contourf(100*Ux/max(max(Ux)),v,'-k')
% hold on
% contour(Amp,k,100*efficient/max(max(efficient)),'-k')
axis([0.3,1.1,-5,65]);
yticks([0:10:60])
xticks([0.4:0.1:1.0])
ax = gca;
ax.FontSize = 19;
% xl=xlabel('$A_2$','Interpreter','latex','Rotation',0,'Fontsize',24);
% yl=ylabel('$l_1/(l_1+l_2)$','Interpreter','latex','Rotation',90,'Fontsize',24);
% title('efficiency','Interpreter','latex','Rotation',0,'Fontsize',24)
% colorbar
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
print -depsc efficient_pd0.0.eps
hold off



% figure
% pcolor(Amp,k,cot/cot_normalize)
% cmap=parula(1000);
% shading interp
% hold on
% v= [1.0 2 5];
% [C,h] =contour(Amp,k,cot/cot_normalize,v,'-k')

% clabel(C,h,'FontSize',15,'Color','k','FontName','Times New Roman')
% caxis([0.5 9])
% % v=[70 90];
% % contourf(100*Ux/max(max(Ux)),v,'-k')
% % hold on
% % contour(Amp,k,100*efficient/max(max(efficient)),'-k')
% axis([0,60,0.4,1.0]);
% xticks([0:10:60])
% yticks([0.4:0.1:1.0])
% ax = gca;
% ax.FontSize = 19;
% % xl=xlabel('$A_2$','Interpreter','latex','Rotation',0,'Fontsize',24);
% % yl=ylabel('$l_1/(l_1+l_2)$','Interpreter','latex','Rotation',90,'Fontsize',24);
% % title('cost of transportation','Interpreter','latex','Rotation',0,'Fontsize',24)
% % colorbar
% set(gca,'XTickLabel',[]);
% set(gca,'YTickLabel',[]);
% print -depsc cot_normalized_by_simple_plate_self_propulsion.eps
% hold off