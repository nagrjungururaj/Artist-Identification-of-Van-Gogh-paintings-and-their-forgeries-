clc;
clear all;
vgg = load('path\imagenet-vgg-m.mat');              % path of the downloaded pre-trained network
l1 = vgg.layers{1,1}.weights{1,1};
for i = 1:96                                        % 96 learned features for VGG-M at the first layer
A2 = l1(:,:,:,i);	
A = rgb2gray(A2);
B = reshape(A,[],1);                                % reshape to vector 
    for j=1:24
    filename = strcat('path-to-gabor-data',int2str(j),'.mat');
    load(filename);
    f2 = reshape(w,[],1);                           % reshape to a vector                       
    [m,n] = size(B);
    m1 = sum(B)/m;
    m2 = sum(f2)/m;
    X = B - m1;
    Y = f2 - m2;
    C = (X'* Y)/(sqrt(sum(X.^2) * sum(Y.^2)));      % correlation co-efficient resulting in 96x24 correlations
    z(j,i) = abs(C);
    end
end

for k = 1:96    
    m(k) = max(z(:,k));                             % get maximum correlations in all the columns 
end
stem(m,'filled')                                    % make a stem plot
xlabel('Number of deep filters')
ylabel('maximum correlation values')
