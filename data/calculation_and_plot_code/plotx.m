 clear all;
close all;
%%
xfreeplnew;
% fig1=1;
fig1= figure('Color',[1 1 1],'Units','centimeters','Position' ,[0.0,0.0,27,13.5]);
figure(fig1), clf

%writerObj = VideoWriter('pitching.mp4');

writerObj = VideoWriter( 'rigid_swimmer.mp4', 'MPEG-4');
writerObj.FrameRate = 8;
% writerObj.CompressionRatio=2;
writerObj.Quality = 100;
open(writerObj);



for i = 181:381
   %eval(['phi_' num2str(phi(i))]);
%    filename = sprintf('ep2_t400_learningrate_l_%0d.csv',i);
%   data=readtable(filename);
      if i<10
          eval(['a=a0' num2str(i) ]);
          eval(['b=b0' num2str(i) ]);
          eval(['c=c0' num2str(i) ]);
          eval(['t=t00' num2str(i) ]);
          oneplots;
      end
  
      if i >9 && i<100
          eval(['a=a' num2str(i) ]);
          eval(['b=b' num2str(i) ]);
          eval(['c=c' num2str(i) ]);
          eval(['t=t0' num2str(i) ]);
          oneplots;
      end

      if i>99
          eval(['a=a' num2str(i) ]);
          eval(['b=b' num2str(i) ]);
          eval(['c=c' num2str(i) ]);
          eval(['t=t' num2str(i) ]);
          oneplots;

      end
%   saveas(gcf,sprintf('FIG%d.png',i))   
    frame = getframe(gcf);
    writeVideo(writerObj,frame)
end


close(writerObj);
% a=a19;b=b19; t=t019;oneplots
% a=a20;b=b20; t=t020;oneplots
% a=a21;b=b21; t=t021;oneplots
% a=a22;b=b22; t=t022;oneplots
% a=a23;b=b23; t=t023;oneplots
% a=a24;b=b24; t=t024;oneplots
% a=a25;b=b25; t=t025;oneplots
% a=a26;b=b26; t=t026;oneplots
% a=a27;b=b27; t=t027;oneplots
% a=a28;b=b28; t=t028;oneplots
% a=a29;b=b29; t=t029;oneplots
% a=a30;b=b30; t=t030;oneplots
% a=a31;b=b31; t=t031;oneplots
% a=a32;b=b32; t=t032;oneplots
% a=a33;b=b33; t=t033;oneplots
% a=a34;b=b34; t=t034;oneplots
% a=a35;b=b35; t=t035;oneplots
% a=a36;b=b36; t=t036;oneplots
% a=a37;b=b37; t=t037;oneplots
% a=a38;b=b38; t=t038;oneplots
% a=a39;b=b39; t=t039;oneplots
% a=a40;b=b40; t=t040;oneplots
% a=a41;b=b41; t=t041;oneplots
% a=a42;b=b42; t=t042;oneplots
% a=a43;b=b43; t=t043;oneplots
% a=a44;b=b44; t=t044;oneplots
% a=a45;b=b45; t=t045;oneplots
% a=a46;b=b46; t=t046;oneplots
% a=a47;b=b47; t=t047;oneplots
% a=a48;b=b48; t=t048;oneplots
% a=a49;b=b49; t=t049;oneplots
% a=a50;b=b50; t=t050;oneplots
% a=a51;b=b51; t=t051;oneplots
% a=a52;b=b52; t=t052;oneplots
% a=a53;b=b53; t=t053;oneplots
% a=a54;b=b54; t=t054;oneplots
% a=a55;b=b55; t=t055;oneplots
% a=a56;b=b56; t=t056;oneplots
% a=a57;b=b57; t=t057;oneplots
% a=a58;b=b58; t=t058;oneplots
% a=a59;b=b59; t=t059;oneplots
% a=a60;b=b60; t=t060;oneplots
% a=a61;b=b61; t=t061;oneplots
% a=a62;b=b62; t=t062;oneplots
% a=a63;b=b63; t=t063;oneplots
% a=a64;b=b64; t=t064;oneplots
% a=a65;b=b65; t=t065;oneplots
% a=a66;b=b66; t=t066;oneplots
% a=a67;b=b67; t=t067;oneplots
% a=a68;b=b68; t=t068;oneplots
% a=a69;b=b69; t=t069;oneplots
% a=a70;b=b70; t=t070;oneplots
% a=a71;b=b71; t=t071;oneplots
% a=a72;b=b72; t=t072;oneplots
% a=a73;b=b73; t=t073;oneplots
% a=a74;b=b74; t=t074;oneplots
% a=a75;b=b75; t=t075;oneplots
% a=a76;b=b76; t=t076;oneplots
% a=a77;b=b77; t=t077;oneplots
% a=a78;b=b78; t=t078;oneplots
% a=a79;b=b79; t=t079;oneplots
% a=a80;b=b80; t=t080;oneplots
% a=a81;b=b81; t=t081;oneplots
% a=a82;b=b82; t=t082;oneplots
% a=a83;b=b83; t=t083;oneplots
% a=a84;b=b84; t=t084;oneplots
% a=a85;b=b85; t=t085;oneplots
% a=a86;b=b86; t=t086;oneplots
% a=a87;b=b87; t=t087;oneplots
% a=a88;b=b88; t=t088;oneplots
% a=a89;b=b89; t=t089;oneplots
% a=a90;b=b90; t=t090;oneplots
% a=a91;b=b91; t=t091;oneplots
% a=a92;b=b92; t=t092;oneplots
% a=a93;b=b93; t=t093;oneplots
% a=a94;b=b94; t=t094;oneplots
% a=a95;b=b95; t=t095;oneplots
% a=a96;b=b96; t=t096;oneplots
% a=a97;b=b97; t=t097;oneplots
% a=a98;b=b98; t=t098;oneplots
% a=a99;b=b99; t=t099;oneplots
% a=a100;b=b100; t=t100;oneplots
% a=a101;b=b101; t=t101;oneplots
% a=a102;b=b102; t=t102;oneplots
% a=a103;b=b103; t=t103;oneplots
% a=a104;b=b104; t=t104;oneplots
% a=a105;b=b105; t=t105;oneplots
% a=a106;b=b106; t=t106;oneplots
% a=a107;b=b107; t=t107;oneplots
% a=a108;b=b108; t=t108;oneplots
% a=a109;b=b109; t=t109;oneplots
% a=a110;b=b110; t=t110;oneplots
% a=a111;b=b111; t=t111;oneplots
% a=a112;b=b112; t=t112;oneplots
% a=a113;b=b113; t=t113;oneplots
% a=a114;b=b114; t=t114;oneplots
% a=a115;b=b115; t=t115;oneplots
% a=a116;b=b116; t=t116;oneplots
% a=a117;b=b117; t=t117;oneplots
% a=a118;b=b118; t=t118;oneplots
% a=a119;b=b119; t=t119;oneplots
% a=a120;b=b120; t=t120;oneplots
% a=a121;b=b121; t=t121;oneplots
% a=a122;b=b122; t=t122;oneplots
% a=a123;b=b123; t=t123;oneplots
% a=a124;b=b124; t=t124;oneplots
% a=a125;b=b125; t=t125;oneplots
% a=a126;b=b126; t=t126;oneplots
% a=a127;b=b127; t=t127;oneplots
% a=a128;b=b128; t=t128;oneplots
%end, break
% break

% 
% figure(fig1) %hold off, %axis([-.6,.6,-1.6,1.6])
% xlabel('x')
%axis equal
%axis equal %ylabel('y')

%figure(fig2), hold off, axis([0,.08,.55,.8])
%xlabel('x'), title('Closeup')
%
%figure(fig3), hold on
%plot(a(:,1),a(:,2),'-'), plot(-a(:,1),a(:,2),'-')
%axis equal, axis([-.6,.6,-1.6,1.6]), title('last time, equal axis')

