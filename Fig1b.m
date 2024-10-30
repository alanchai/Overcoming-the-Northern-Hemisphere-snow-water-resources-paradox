clear;clc;close
set(groot, 'DefaultAxesFontName', 'Times New Roman');
set(groot, 'DefaultTextFontName', 'Times New Roman');
%Load the data
load('Data for Fig1b.mat')
%draw the Fig1b
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
load('CustomColormap for Fig1b.mat');
colormap(CustomColormap);
h = colorbar('Location', 'southoutside','Ylim',[-40 40],'YTick',[-40 -20 0 20 40]);
h.Position = [0.1 0.1 0.8 0.05]; %[left bottom width height]
set(h, 'FontSize', 14);
x = 0;  
y = -34;  
text(x, y, 'Freezing day frequency bias (days)', 'FontSize', 14, 'HorizontalAlignment', 'center');
caxis([-40.2 40.2]);
newFontSize = 14;
set(gca, 'FontSize', newFontSize);
aa = load('significance_mask for Fig1b.mat');
bb = aa.Test_result;
xline = -178:0.2:178;
hold on;
nsize = length(xline);
for j = -250:4:150
    yline = min(max(xline-j,-89),89);
    for i = 1:nsize-1
        xs =2*ceil(180+xline(i));
        ys =2*ceil(90-yline(i));
        if (bb(xs,ys) == 1)
            plot(xline(i:i+1),yline(i:i+1),'color',[0.5 0.5 0.5]);
        end
    end
end

