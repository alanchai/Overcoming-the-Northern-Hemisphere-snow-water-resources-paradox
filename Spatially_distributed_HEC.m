%Code used for calculating the constrained future SWE after using HEC and its uncertainty
warning off
close all
clear
clc
% load observed SWE and its uncertainty across the datasets
load ob_ave_SWE
load ob_un_SWE
% load simulated historical and future SWE from 31 CMIP6 models
load Sim_SWE_his
load Sim_SWE_future
Future_SWE_ave_after_HEC=zeros(720,360);% Constrained future SWE after using HEC
Future_SWE_std_after_HEC=zeros(720,360); % Uncertainty of constrained future SWE after using HEC
for lon=1:720
    for lat=1:360
        x=Sim_SWE_his(lon,lat,:);
        y=Sim_SWE_future(lon,lat,:);
        uo=ob_ave_SWE(lon,lat);
        sigmao=ob_un_SWE(lon,lat);
        X=zeros(1,31);
        for i=1:31
            X(1,i)=x(1,1,i);
        end
        Y=zeros(1,31);
        for i=1:31
            Y(1,i)=y(1,1,i);
        end
        [r,m,b] = regression(X,Y);
        Corr_R=r;
        mean_x=mean(X(1,:));
        sigma_x=std(X(1,:));
        mean_y=mean(Y(1,:));
        std_y=std(Y(1,:));
        SNR1=sigma_x^2;
        SNR2=sigmao^2;
        SNR=SNR1./SNR2;
        Data1=Corr_R.*std_y./sigma_x;
        Data2=uo-mean_x;
        Data3=sigma_x^2+sigmao^2;
        Data4=Data1.*Data2./Data3.*sigma_x^2;
        Best_after=mean_y+Data4;
        Future_SWE_ave_after_HEC(lon,lat)=Best_after;
        val1=1-Corr_R^2./(1+1./SNR);
        val2=sqrt(val1.*std_y^2);
        Future_SWE_std_after_HEC(lon,lat)=real(val2);
    end
end

save Future_SWE_ave_after_HEC Future_SWE_ave_after_HEC
save Future_SWE_std_after_HEC Future_SWE_std_after_HEC
