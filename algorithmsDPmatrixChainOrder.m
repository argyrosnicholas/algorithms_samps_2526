% Problem: Matrix Chain Multiplication
% Input: A chain of Matrices
% Expected Output: Their optimal parenthesisation
% Pseudocode Structure (initially designed for Java)

% Matrix_Chain_Order(p)
% /* p=<p0,p1,...,pn>, the dimensions of the matrices?*
% for i=1 to n do
%   m[i,i]=0
% for l=2 to n do /* l denotes to length
%       for i=1 to n-l+1 do
%           j=i+l-1
%           m[i,j]=0
%           for k=i to j-1 do
%               q=m[i,k]+m[k+1,j]+p(i-1)*p(k)*p(j)
%               if q<m[i,j] then m[i,j]=q
% return m

% Source: http://www.math.ntua.gr/~symvonis/
% > Αλγόριθμοι και Πολυπλοκότητα > Διάλεξη 11: Δυναμικός Προγραμματισμός

clear;clc

tic

w = 100;
x = 100;
y = 100;
z = randi([1, w]);

dims = randi(x, 1, z + 1);
A = cell(1, z);

for i = 1:z
    rows = dims(i);
    cols = dims(i+1);
    currentMatrix = randi(y, rows, cols);
    A{i} = currentMatrix;
end

p = dims;

n=length(A);
m=zeros(n,n);

for l=2:n
    for i=1:n-l+1
        j=i+l-1;
        m(i,j)=inf;
        for k=i:j-1
            q=m(i,k)+m(k+1,j)+p(i)*p(k+1)*p(j+1);
            if q<m(i,j)
                m(i,j)=q;
                split(i,j)=k;
            end
        end
    end
end

t_optimalpar=toc;
disp("The Optimal Parenthesisation was found in " + t_optimalpar + " seconds")