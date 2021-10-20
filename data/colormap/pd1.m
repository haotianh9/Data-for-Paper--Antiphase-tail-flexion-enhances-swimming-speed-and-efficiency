clc;
clear all;
close all;
Ux=[4.3994		4.3994		4.3994		4.3994		4.3994		4.3994		4.3994
3.8502		3.9590		4.0803		4.2269		4.3512		4.4619		4.3994
3.4933		3.6594		3.9177		4.3842		4.5747		4.5255		4.3994
3.9729		3.8932		4.1819		5.0783		5.1854		4.6847		4.3994
5.8495		5.0579		5.0921		6.3909		6.2133		4.9532		4.3994
8.3895		6.9580		6.5811		8.2398		7.6169		5.3300		4.3994
9.8905		8.7128		8.2608		10.4056		9.3185		5.7985		4.3994
10.1015		9.5438		9.5609		12.4349		11.2019		6.3285		4.3994
9.7502		9.5652		10.1280		13.6407		13.0362		6.8798		4.3994
9.2203		9.1325		9.9847		13.5724		14.3799		7.4083		4.3994
8.6356		8.4979		9.2903		12.4700		14.6674		7.8685		4.3994
8.0121		7.8298		8.3729		11.2095		13.5925		8.2204		4.3994
7.3099		7.1418		8.3750		11.7364		11.3316		8.2988		4.3994]

W_input=[98.2710		98.2710		98.2710		98.2710		98.2710		98.2710		98.2710
45.2582		51.7362		58.4933		67.4737		77.3684		87.1107		98.2710
19.1364		25.1706		33.3792		47.7660		63.9583		77.0862		98.2710
12.3885		15.6021		21.3240		37.3250		55.0823		69.5112		98.2710
23.6245		19.3914		19.7313		35.4058		52.9149		63.9258		98.2710
67.8984		44.2545		31.0772		43.0613		55.9291		60.5730		98.2710
154.6151		100.1979		61.7199		67.0628		65.8331		59.0042		98.2710
275.7074		181.1455		114.8311		109.0640		84.4870		58.7387		98.2710
410.3368		290.2316		187.8636		166.8183		115.6072		60.4848		98.2710
581.1229		399.2224		269.2441		226.6582		153.5967		63.2630		98.2710
776.4601		531.5039		353.7837		279.8075		189.8038		67.0190		98.2710
988.6743		676.3646		443.0778		332.2031		211.5503		71.9028		98.2710
1.2284E+03		825.4069		549.0754		411.4085		210.9855		74.0399		98.2710]


% Ux=Ux';
% W_input=W_input';


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
[k,Amp]=meshgrid(k,Amp);
% Amp=Amp';
% k=k';




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
v= [1.0 2 2.5];
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

print -depsc Ux_pd1.0.eps
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
% pcolor(Amp,k,efficient/efficient_normalize);
% hold on
sz=99;
pq=1;
for i=1:length(Amp(:,1))
    for j=1:length(Amp(1,:))
        x1(pq)=k(i,j);
        y1(pq)=Amp(i,j);
        a1(pq)=efficient(i,j)/efficient_normalize;
        pq=pq+1;
    end
end
scatter(x1,y1,sz,a1,'s','filled')
colormap winter
hold on
caxis([0.5 7])
v= [1 2 5 7 ];
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
print -depsc efficient_pd1.0.eps
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