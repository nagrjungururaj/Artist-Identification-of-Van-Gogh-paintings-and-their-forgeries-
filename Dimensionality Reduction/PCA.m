clc;
close all;
clear all;
format long g
load('path\train.mat');                 % path to output of feature extracted training data
load('path\valid.mat');                 % path to output of feature extracted validation data
load('path\test.mat');                  % path to output of feature extracted test data

Data = tr1;
mu = mean2(Data);                       % mean of train data
CovX = cov(Data);                       % co-variance matrix of train data
[V,D] = eig(CovX);                      % EVD of co-variance matrix 
[D,ord] = sort(diag(D), 'descend');     % arrange the eigen values and eigen vectors in descending order   

y = V(:,1:22);                          % enter the desired dimension, here we use 22 for example to get a 22 dimensional data
pr = tr1*y;  %train pca

% validation,test

v =(val-mu)*y;                          % using projections from train to get reduced PCA validation
t = (te-mu)*y;                          % using projections from train to get reduced PCA test

v1 = vertcat(pr,t);
final = vertcat(v1,v);                  % data to NN
