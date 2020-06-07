function LUpiv(A,b)
A=[48,-24,0,-12;-24,24,12,12;0,6,20,2;-6,6,2,16]
b=[4;4;-2;-2]
[m,n] = size(A);
nb= n+ 1;Ab= [A b];
Ab(2:m,1) = Ab(2:m,1)/Ab(1,1);
for k= 2:m
    for j= k:nb
        Ab(k,j) = Ab(k,j)- Ab(k,1:k-1) * Ab(1:k- 1,j);
    end
    for i= k+1:m
        Ab(i,k)= (Ab(i,k)- Ab(i,1:k-1) * Ab(1:k-1,k))/Ab(k,k);
    end
end
x= zeros(n,1);
x(n) = Ab(n,nb)/Ab(n,n);
for k= n-1:- 1:1
    x(k) = (Ab(k,nb)- Ab(k,k+1:n) * x(k+ 1:n,1))/Ab(k,k);
end
for k= 1:n
    fprintf(' x[%d]= %f\n' ,k,x(k));
end

