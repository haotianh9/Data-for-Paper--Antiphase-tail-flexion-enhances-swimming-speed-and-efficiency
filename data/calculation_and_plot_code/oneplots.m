% one simple plot

xh=a(:,1); yh=a(:,2);
xs1=b(:,1); ys1=b(:,2);ws1=b(:,3);
% xs2=c(:,1); ys2=c(:,2); 
figure(fig1),clf
ax = gca;
% subplot('position',[0.15,0.3,0.8,0.5092]), 
vec=[xh(length(xh))-20,xh(length(xh)),-5,5];


ax1 = axes('Position',[0.0 0.0 1.0 1.0]);
plot(ax1,xh,yh,'k-','linewidth',2.5);
hold on;
% plot(-xs1,ys1,'b-','linewidth',1);
scatter(ax1,xs1,ys1,1.9,ws1,'filled')
colormap(redblue)
caxis([-0.02,0.02])
% uback = uosi*sin(2*pi/period*t)+ufar;
% xx = -3*ones(1,5);
% yy = [0 0.2 0.4 0.6 0.8];
% uu = uback/2*ones(length(xx));
% vv = zeros(length(xx));
% quiver(xx,yy,uu,vv,0,'k');
isize=19;
lab=num2str(t,'%10.3f\n');
%title(lab,'FontSize',isize);
set(gca,'FontSize',isize);
set(gcf,'color','white');
% xl=xlabel('$x$','Interpreter','latex','Rotation',0,'Fontsize',isize);
% yl=ylabel('$y$','position',[-xh(1)-7.9,0],'Interpreter','latex','Rotation',0,'Fontsize',isize);
% yl.Position(1) = yl.Position(1) - 0.1;
%text(25,-25,lab,'FontSize',isize)
%title('St=0.8, t/\tau=7','FontSize',isize)
% xx=30;
xticks(linspace(-500,700,601));
yticks([-5 -2.5 0 2.5 5]);
xticklabels([]);
yticklabels([]);
% xticks([]);
% yticks([]);
axis equal;
axis(vec);
box off
ax1.YAxis.Visible = 'off';
%axis([0,10+2*xx,-xx,xx])
% i
% eval(['exportgraphics(fig1,"frame' num2str(i) '.png")' ]);
pause(0.2);

