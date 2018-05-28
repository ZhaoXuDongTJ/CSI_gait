function [coss] = get_coss(file)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    csi_trace = read_bf_file(file);
    m = size(csi_trace, 1);  % 得出一个dat文件的包的数量
    dataSet = zeros(m, 3) ;  % 创建 一个可以容纳 包数量的矩阵                
    coss = [];

    for k=1:50
        t = get_scaled_csi(csi_trace{k}) ;                              
        t = db(abs(squeeze(t).')) ;
        dataSet(k,:) = mean(t) ;  %  解决上述问题：  对30个数据取了平均值
        coss = [coss;mean(t)];
    end
end

