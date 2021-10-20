clear all;
close all;


gamma1 = [];
gamma2 = [];
sigma1 = [];
sigma2 = [];
utan1 = [];
utan2 = [];
time = [];
xl = [];
x1 = [];
x2 = [];
y1 = [];
y2 = [];
ds = [];

xfreeplnew;
isize=14;
set(gca,'FontSize',isize)
set(gcf,'color','white')
fig1=1;
figure(fig1), clf

%%
for i = 376:1:376
    
   %eval(['phi_' num2str(phi(i))]);
%    filename = sprintf('ep2_t400_learningrate_l_%0d.csv',i);
%   data=readtable(filename);
  if i<10
  eval(['a=a0' num2str(i) ]);
 eval(['b=b0' num2str(i) ]);
 eval(['c=c0' num2str(i) ]);
  eval(['t=t00' num2str(i) ]);
  flowfield;
  end
  
  if i >9 && i<100
  eval(['a=a' num2str(i) ]);
 eval(['b=b' num2str(i) ]);
 eval(['c=c' num2str(i) ]);
  eval(['t=t0' num2str(i) ]);
  flowfield;
  end
  
  if i>99 && i<1000
  eval(['a=a' num2str(i) ]);
 eval(['b=b' num2str(i) ]);
 eval(['c=c' num2str(i) ]);
  eval(['t=t' num2str(i) ]);
  flowfield;
  end
  
    if i>999
  eval(['a=a' num2str(i) ]);
 eval(['b=b' num2str(i) ]);
 eval(['c=c' num2str(i) ]);
  eval(['t=t' num2str(i) ]);
  flowfield;
      
  end
      
    
end
