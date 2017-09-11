clc;
clear all;

load('path\train.mat');         % path to feature engineered output of train data in .mat format
load('path\valid.mat');         % path to feature engineered output of validation data in .mat format
load('path\test.mat');          % path to feature engineered output of test data in .mat format


n1 = 97;                        % 97 images of Van-Gogh painting images
n2 = 163;                       % 163 images of Non-Van Gogh painting images
N = n1 + n2;

vg = tr1(1:97,:);
nvg = tr1(98:260,:);

%class means

m1 = sum(vg)/n1;
m2 = sum(nvg)/n2;

% class scatters
c1 = cov(vg);
c2 = cov(nvg);

a = zeros(3,24);
b = zeros(66,24);
m = mean(tr1);
ma = vertcat(m,a);
mb = vertcat(m,b);

% Between-class scatter matrix

Sb = (n1/N)*(m1-m)' * (m1-m) + (n2/N)*(m2-m)'* (m2-m);

S1 = cov(vg);
S2 = cov(nvg);

% Within-class scatter matrix
Sw = (n1/N)* S1 + (n2/N)* S2;

% just for check and correctness

% St = Sw + Sb; 
% c = cov(tr1);
% r = rank(Sb);

Data = inv(Sw)*Sb;
[V,D] = eig(Data);
[D,ord] = sort(diag(D), 'descend');



y = V(:,1:20); % gathers first highest 20 eigen vectors, change as required 

pr = tr1*y;  %train lda

%validation, test

v =(val-ma)*y;
t = (te-mb)*y;

v1 = vertcat(pr,t);
final = vertcat(v1,v); %data to NN
