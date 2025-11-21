% Problem: Fibonacci Numbers (Dynamic Programming)
% Input: An arbirtary integer n.
% Expected Output: The n-th therm of the Fibonacci sequence.
% Pseudocode Structure (initially designed for Java)

% Non_Recursive_Fibonacci(n)
% /* A[1...n] is an array in which we store F(1)...F(n)/*
% A[0]=0
% A[1]=1
% for i=2 to n do
%   A[i]=A[i-1]+A[i-2]
% return A[n]

% Source: http://www.math.ntua.gr/~symvonis/
% > Αλγόριθμοι και Πολυπλοκότητα > Διάλεξη 11: Δυναμικός Προγραμματισμός

clear;clc

tic
n=randi(1e+02);
A=zeros(1,n);
% Starting with A(1) and A(2) instead of A(0) and A(1), because there can
% be no A(0) in a MATLAB environment.
A(1)=0;
A(2)=1;

for i=3:n
    A(i)=A(i-1)+A(i-2);
end
disp('The n-th term of the Fibonacci sequence is:');
disp(A(n));
disp('The full Fibonacci sequence with n terms is:');
disp(A);
t_fib = toc;
disp("The n-th Fibonacci term was found in " + t_fib + " seconds")