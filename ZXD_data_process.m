csi_trace = read_bf_file('data/test/csi_a10_1.dat');
%csi_entry = csi_trace{1}
%csi = get_scaled_csi(csi_entry)
%shi = db(abs(squeeze(csi).'))

m = size(csi_trace, 1);  % 得出一个dat文件的包的数量
dataSet = zeros(m, 3) ;  % 创建 一个可以容纳 包数量的矩阵                问题：一个包一行？
coss = [];

for k=1:200
    t = get_scaled_csi(csi_trace{k}) ;                              
    t = db(abs(squeeze(t).')) ;
    dataSet(k,:) = mean(t) ;  %  解决上述问题：  对30个数据取了平均值
    coss = [coss;mean(t)];
end

%coss = guassian_flitering(coss);

clf;
hold on ;
%plot(dataSet(:,1),'r') ;
%plot(dataSet(:,2),'g') ;
%plot(dataSet(:,3),'b') ;
figure(1)
plot(coss(:,1),'r');
plot(coss(:,2),'g');
plot(coss(:,3),'b');
coss = time_flitering(coss);
xlabel('time(s)');
ylabel('CSI(db)');
title('the CSI curve changes with time') ;
legend('MIMO1', 'MIMO2', 'MIMO3') ;
hold off ;
hold on ;
figure(2)
disp(size(coss));
plot(coss(:,1),'r');
plot(coss(:,2),'g');
plot(coss(:,3),'b');
xlabel('time(s)');
ylabel('CSI(db)');
title('the CSI curve changes with time') ;
legend('MIMO1', 'MIMO2', 'MIMO3') ;
hold off ;

cossc = coss == -Inf;
coss(cossc) = 0;
 [coeff,score,latent] = pca(coss);
 
 hold on ;
figure(3)
plot(score)
hold off ;
 
% plot(shi)
% legend('RX Antenna A', 'RX Antenna B', 'RX Antenna C', 'Location', 'SouthEast' )
% xlabel('Subcarrier index')
% ylabel('SNR [dB]')
 
% SNR = db(get_eff_SNRs(csi), 'pow')
function flitered_data = guassian_flitering(dataSet)
%   flitering dataSet use guassian method
%   input : dataSet - m*3 matrix for data
%   output : flitered_data - dataSet flierted
%   -----------------------------------------------------------------------
    flitered_data = dataSet ;
    h = fspecial('gaussian', 100, 20) ;
    for type=1:3
        flitered_data(:,type) = filter2(h, dataSet(:,type))*20;
    end
end

function flitered_data = time_flitering(dataSet)
%   flitering dataSet use time histroical factor
%   input : dataSet - m*3 matrix for data
%   output : flitered_data - dataSet flierted
%   -----------------------------------------------------------------------
    w = 100 ; % histroical param
    m = size(dataSet, 1) ;
    t = dataSet ;
    for type = 1:3
        for p=w:m
            sum_mol = 0 ; % Molecular
            sum_den = 0 ; % Denominator
            for q=w:-1:1
                sum_mol = sum_mol + q*dataSet(p-(w-q),type) ;
                sum_den = sum_den + q ;
            end
            t(p,type) = sum_mol/sum_den ;
        end
    end
    flitered_data = t ;
end