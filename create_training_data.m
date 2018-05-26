function [trainData, trainLabel] = create_training_data(n)
%   use attibutes extraction to create training dataSet
%   input : numMvm - number of movements
%   output : trainData - attributes set of examples
%            trainLabel - label of examples

    % initializes
    
    trainData = [];
    trainLabel = [] ;
    
    for i=1:n
        filepath = strcat('data/user', i,'/',i,'.mat');
        data = load(filepath);
        
        % pca Œ Ã‚
        ac = data==-Inf;
        data(ac)=0;
        [coeff,score,latent] = pca(data)
        
        trainData = [trainData;score];
        trainLabel = [trainLabel;i];
    end
    

end

