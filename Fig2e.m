clear;clc;close
set(groot, 'DefaultAxesFontName', 'Times New Roman');
set(groot, 'DefaultTextFontName', 'Times New Roman');
%Load the data
load('Data for Fig2e.mat')
%draw the Fig2e
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
load('CustomColormap for Fig2e.mat');
colormap(CustomColormap);
h = colorbar('Location', 'southoutside','YLim',[-50 50],'YTick',[-50 -25 0 25 50]);
h.Position = [0.1 0.075 0.8 0.05]; %[left bottom width height]
caxis([-50.25 50.25]);
x = 0;
y = -30.5;
text(x, y, 'Constrained minus unconstrained future', 'FontSize', 13, 'HorizontalAlignment', 'center');
x = 0;
y = -40.72;
text(x, y, 'freezing day frequency under SSP245 (days)', 'FontSize', 13, 'HorizontalAlignment', 'center');
newFontSize = 13;
set(gca, 'FontSize', newFontSize);

