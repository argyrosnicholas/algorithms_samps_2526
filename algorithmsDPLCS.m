% Problem: Longest Common Subsequence
% Input: Two Arbitrary Arrays X,Y(sequence of characters)
% Expected Output: The Longest Common Subsequence of X & Y arrays.
% Pseudocode Structure (initially designed for Java)

% LCS_length(X,Y)
% m=length(X)
% n=length(Y)
% for i=1 to m do c[i,0]=0
% for j=1 to n do c[0,j]=0
% for i=1 to m do
%   for j=1 to n do
%       if x_i=y_j
%           then c[i,j]=c[i-1,j-1]+1
%               b[i,j]=down-left diagonal arrow
%           else if c[i-1,j]>=c[i,j-1]
%                   then c[i,j]=c[i-1,j]
%                       b[i,j]=down arrow
%                   else c[i,j]=c[i,j-1]
%                       b[i,j]=left arrow
% return c,b

% Source: http://www.math.ntua.gr/~symvonis/
% > Αλγόριθμοι και Πολυπλοκότητα > Διάλεξη 12: Μέγιστη κοινή ακολουθία

clear;clc

tic
% Arbitrary Initial Conditions
m = randi(1e+04,1);
n = randi(1e+04,1);
X = char(randi([97 122], 1, m));
Y = char(randi([97 122], 1, n));
c=zeros(m+1,n+1);
b = zeros(m+1, n+1);

% 1: diagonal (↖), 2: up (↑), 3: left (←)
for i=2:m+1
    for j=2:n+1
        if X(i-1) == Y(j-1)
            c(i,j)=c(i-1,j-1)+1;
            b(i,j)=1;
        elseif c(i-1,j)>=c(i,j-1)
                c(i,j)=c(i-1,j);
                b(i,j)=2;
        else c(i,j)=c(i,j-1);
            b(i,j)=3;
        end
    end
end
disp('The LCS b and c matrices have been calculated');

l = c(m+1, n+1);
lcs = blanks(l);
lcs_index = l;
i = m + 1;
j = n + 1;

while lcs_index > 0
    switch b(i,j)
        case 1
            lcs(lcs_index) = X(i-1);
            lcs_index = lcs_index - 1;
            i = i - 1;
            j = j - 1;
        case 2
            i = i - 1;
        case 3
            j = j - 1;
    end
end

disp('The Longest Common Subsequence is:');
disp(lcs);
t_lcs = toc;
disp("LCS was found in " + t_lcs + " seconds")
