% % one simple plot
% 
% % x1=a(:,1); 
% % x2=a(:,3); y2=a(:,4);
% x1 = [x1,a(:,1)];
% y1 = [y1,a(:,2)];
% 
% x2 = [x2,a(:,3)];
% y2 = [y2,a(:,4)];
% 
% xl = [xl,a(:,6)];
% ds = [ds,a(:,5)];
% % 
% % gamma1 = a(:,7);
% % gamma2 = a(:,8);
% % sig1 = a(:,9);
% % sig2 = a(:,10);
% % utan1 = a(:,11);
% % utan2 = a(:,12);
% 
% gamma1 = [gamma1,a(:,7)];
% gamma2 = [gamma2,a(:,8)];
% sigma1 = [sigma1,a(:,9)];
% sigma2 = [sigma2,a(:,10)];
% utan1 = [utan1,a(:,11)];
% utan2 = [utan2,a(:,12)];
% time = [time,t];

%%
x1 = -[a(:,1)];
y1 = [a(:,2)];
% 
% x2 = [a(:,3)];
% y2 = [a(:,4)];

xl =[a(:,5)];
ds = [a(:,4)];
% 
% gamma1 = a(:,7);
% gamma2 = a(:,8);
% sig1 = a(:,9);
% sig2 = a(:,10);
% utan1 = a(:,11);
% utan2 = a(:,12);

gamma1 = [a(:,6)];

sigma1 = [a(:,7)];

utan1 = [a(:,8)];

time = [t];


xs1 = -b(:,1);
ys1 = b(:,2);
w1 = b(:,3);

% xs2 = c(:,1);
% ys2 = c(:,2);
% w2 = c(:,3);

xmin=x1(1)-2.5;
xmax=x1(1)+19;
ymin=-4.5;
ymax=4.5;
ufar=0;
%%
[x,y] = meshgrid(xmin:0.1:xmax,ymin:0.1:ymax);
u1 = zeros(size(x));
v1 = zeros(size(x));
u2 = zeros(size(x));
v2 = zeros(size(x));
ub1 =  zeros(size(x));
vb1 =  zeros(size(x));
ub2 =  zeros(size(x));
vb2 =  zeros(size(x));
for j = 1:length(w1)
    u1 = u1 + w1(j).*((y-ys1(j)))./((y-ys1(j)).^2 + (x-xs1(j)).^2 + 0.01);
    v1 = v1 - w1(j).*((x-xs1(j)))./((y-ys1(j)).^2 + (x-xs1(j)).^2 + 0.01);
end
% for j = 1:length(w2)
%     u2 = u2 - w2(j).*((y-ys2(j)))./((y-ys2(j)).^2 + (x-xs2(j)).^2 + 0.01);
%     v2 = v2 + w2(j).*((x-xs2(j)))./((y-ys2(j)).^2 + (x-xs2(j)).^2 + 0.01);
% end

for j = 1:length(sigma1)
   ub1 = ub1 +  sigma1(j).*ds(j).*((y-y1(j)))./((y-y1(j)).^2 + (x-x1(j)).^2 + 0.001);
%    ub2 = ub2 -  sigma2(j).*ds(j).*((y-y2(j)))./((y-y2(j)).^2 + (x-x2(j)).^2 + 0.001);
   vb1 = vb1 - sigma1(j).*ds(j).*((x-x1(j)))./((y-y1(j)).^2 + (x-x1(j)).^2 + 0.001);
%    vb2 = vb2 + sigma2(j).*ds(j).*((x-x2(j)))./((y-y2(j)).^2 + (x-x2(j)).^2 + 0.001);
end

u = u1+u2 + ub1 + ub2;
v = v1+v2 + vb1 + vb2;

u = u./(2*pi)+ufar;
v = v./(2*pi);

%%

[xo,yo] = meshgrid(xmin:0.1:xmax,ymin:0.1:ymax);
u1o =zeros(size(xo));
v1o = zeros(size(xo));
u2o =zeros(size(xo));
v2o = zeros(size(xo));
ub1o =  zeros(size(xo));
vb1o =zeros(size(xo));
ub2o = zeros(size(xo));
vb2o = zeros(size(xo));

for j = 1:length(w1)
    u1o = u1o + w1(j).*((yo-ys1(j)))./((yo-ys1(j)).^2 + (xo-xs1(j)).^2 );
    v1o = v1o - w1(j).*((xo-xs1(j)))./((yo-ys1(j)).^2 + (xo-xs1(j)).^2 );
end
% for j = 1:length(w2)
%     u2o = u2o - w2(j).*((yo-ys2(j)))./((yo-ys2(j)).^2 + (xo-xs2(j)).^2 + 0.01);
%     v2o = v2o + w2(j).*((xo-xs2(j)))./((yo-ys2(j)).^2 + (xo-xs2(j)).^2 + 0.01);
% end

for j = 1:length(sigma1)
   ub1o = ub1o +  sigma1(j).*ds(j).*((yo-y1(j)))./((yo-y1(j)).^2 + (xo-x1(j)).^2);
%    ub2o = ub2o -  sigma2(j).*ds(j).*((yo-y2(j)))./((yo-y2(j)).^2 + (xo-x2(j)).^2 + 0.001);
   vb1o = vb1o - sigma1(j).*ds(j).*((xo-x1(j)))./((yo-y1(j)).^2 + (xo-x1(j)).^2);
%    vb2o = vb2o + sigma2(j).*ds(j).*((xo-x2(j)))./((yo-y2(j)).^2 + (xo-x2(j)).^2 + 0.001);
end

uo = u1o+u2o + ub1o + ub2o;
vo = v1o+v2o + vb1o + vb2o;

uo = uo./(2*pi)+ufar;
vo = vo./(2*pi);
%%
figure,
% hh = pcolor(x,y,(u.^2 + v.^2).^0.5);
% set(hh, 'EdgeColor', 'none');
% colormap(flipud(gray))
% colormap(gray)
%caxis([-0 4.5])
% hold on

%scatter(xs1,ys1,[],w1)
%scatter(xs2,ys2,[],w2)

ddd=5;
h1 = quiver(x(1:ddd:end,1:ddd:end),y(1:ddd:end,1:ddd:end),u(1:ddd:end,1:ddd:end),v(1:ddd:end,1:ddd:end),'color',[0.5 0.5 0.5]);
set(h1,'AutoScale','on', 'AutoScaleFactor', 1.5)
axis equal 
ylim([ymin ymax]) 
xlim([xmin xmax])
set(gca, 'xtick',[])
set(gca, 'ytick',[])
hold on
plot(xs1(1:4:end),ys1(1:4:end),'b.');
hold on
plot(x1,y1,'k','linewidth',1)
hold on
print -depsc -painters velocity.eps

% %% vorticity 
% n = length(xo);
% 
omega = (vo(3:n,3:n)-vo(1:n-2.1:n-2))./(xo(3:n,3:n)-xo(1:n-2,1:n-2)) - (uo(3:n,3:n)-uo(1:n-2,1:n-2))./(yo(3:n,3:n)-yo(1:n-2,1:n-2)) ;
xoo = (xo(1:n-2,1:n-2)+xo(3:n,3:n))/2;
yoo =(yo(1:n-2,1:n-2)+yo(3:n,3:n))/2;
% %%
% figure,
% load rbcmap.mat
% colormap(cmap)
% hh = pcolor(xoo(1:3:end,1:3:end),yoo(1:3:end,1:3:end),omega(1:3:end,1:3:end));
% set(hh, 'EdgeColor', 'none');
% %colormap(flipud(gray))
% colormap(jet)


% caxis([-45 45])
% hold on
% plot(xs1(1:4:end),ys1(1:4:end),'.');
% hold on
% plot(x1,y1,'k','linewidth',3)


%scatter(xs1,ys1,[],w1)
%scatter(xs2,ys2,[],w2)


% h1 = quiver(x(1:2:end),y(1:2:end),u(1:2:end),v(1:2:end));
% set(h1,'AutoScale','on', 'AutoScaleFactor', 1.5)
% axis equal 
% ylim([-3 3]) 

% axis equal 
% ylim([-3 3]) 
% xlim([x1(end)-17 x1(end)+1])
% set(gca, 'xtick',[])
% set(gca, 'ytick',[])
% print -depsc -painters vorticity.eps