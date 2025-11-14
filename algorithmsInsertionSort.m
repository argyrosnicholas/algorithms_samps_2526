% Problem: Insertion Sort
% Input: Arbitrary Array A(sequence of numbers)
% Expected Output: A sorted permutation of the input sequence A.
% Pseudocode Structure (initially designed for Java)

%Insertion_Sort(A)
%for j<-2 to length(A) do
    % key <- A[j]
    % /*Insert A[j] into the sorted sequence A[1...j-1] */
    % i <- j-1
    % while i>0 and A[i]>key do
        % A[i+1] <- A[i]
        % i <- i-1
    % A[i+1] <- key

% Source: http://www.math.ntua.gr/~symvonis/
% > Αλγόριθμοι και Πολυπλοκότητα > Διάλεξη 2: Εισαγωγή (συνέχεια)

clear;clc
tic
% Arbitrary Initial Conditions
n=randi(1e+5,1);
A=randi(n,1,n);
l=length(A);

for j=2:l
    key=A(j);
    i=j-1;
    while i>0 && A(i)>key
        A(i+1)=A(i);
        i=i-1;
    end
    A(i+1)=key;
end

t_insertion_sort = toc;
disp("Insertion Sort finished in " + t_insertion_sort + " seconds")

% Insertion Sort will be later compared to every other Sort method in terms
% of time complexity based on the above-mentioned metric.