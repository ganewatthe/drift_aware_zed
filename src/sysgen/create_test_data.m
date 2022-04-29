clear variables;

load('A_BST_minus80.mat');

A_BST_minus80 = [A_BST_minus80; A_BST_minus80];
A_BST_minus80 = [A_BST_minus80; A_BST_minus80];
A_BST_minus80 = [A_BST_minus80; A_BST_minus80];

L = length(A_BST_minus80);
Num_Bins = 25;

Cumsum_vld = zeros(L, 1);
Cumsum = zeros(L, 1);

for i=100:10000:L
   Cumsum_vld(i:i+Num_Bins-1) = 1;
   Cumsum(i:i+Num_Bins-1) = 0;
end
