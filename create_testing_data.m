function score = create_testing_data(data)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
    ac = data==-Inf;
    data(ac)=0;
    
    [coeff,score,latent] = pca(data);
end

