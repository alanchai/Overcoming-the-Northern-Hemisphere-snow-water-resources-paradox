clear;clc;close
set(groot, 'DefaultAxesFontName', 'Times New Roman');
set(groot, 'DefaultTextFontName', 'Times New Roman');
%Load the data
load('Data for Fig2a.mat')
%draw the Fig2a
lon=-179.75:0.5:179.75;
lat=89.75:-0.5:-89.75;
figure(1)
set (gcf,'Position',[300,300,600,300]);  % [left bottom width height]
ax = axes;
ax.Position = [0.1 0.35 0.8 0.6]; % [left bottom width height]
[Lon1,Lat1]=meshgrid(lon,lat);
pcolor(Lon1,Lat1,Data');
set(pcolor(Lon1,Lat1,Data'),'linestyle','none');
set(gca,'xtick',-179.75:59.91666:179.75,'xticklabel',{'180^o','120^oW','60^oW','0^o','60^oE','120^oE','180^o'});
set(gca,'ytick',-0:40:90,'yticklabel',{'0^oN','40^oN','80^oN'});
ylim([-10 90]);
shading interp;
load('CustomColormap for Fig2a.mat');
colormap(CustomColormap);
h = colorbar('Location', 'southoutside','YLim',[0.6 1],'YTick',[0.6 0.7 0.8 0.9 1]);
h.Position = [0.1 0.075 0.8 0.05]; %[left bottom width height]
x = 0;  
y = -30.5;  
text(x, y, '(Emergent constraint on future freezing day frequency)', 'FontSize', 13, 'HorizontalAlignment', 'center');
x = 0;  
y = -40.72;  
text(x, y, 'Correlation coefficients under SSP245', 'FontSize', 13, 'HorizontalAlignment', 'center');
caxis([0.597 1.003]);
newFontSize = 13;
set(gca, 'FontSize', newFontSize);
