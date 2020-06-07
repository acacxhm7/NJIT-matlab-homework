
function GEpiv(A,b) % b为列向量
A = [1,1,0,3;2,1,-1,1;3,-1,-1,3;-1,2,3,-1];
b =[4;1;-3;4];
[m,n] = size(A);
nb= n+1;Ab=[A b];
%.....消元
for i= 1:m- 1
    [pivot,p] = max(abs( Ab(i:n,i))); %见下
    ip= p+i-1; %计算出主元的行下标
    if ip~= i
        Ab([i ip],:) = Ab([ip i],:); %行交换
    end
    pivot = Ab(i,i); 
    for k=i+1:m
        Ab(k,i:nb) = Ab(k,i:nb) - (Ab(k,i)/pivot) * Ab(i,i:nb);
    end
end
%....回代
x = zeros(n,1);
x(n) = Ab(n, nb)/Ab(n,n);
for i= n-1:-1:1
    x(i) = (Ab(i,nb)-Ab(i,i + 1:n) * x(i+ 1:n,1))/Ab(i,i);
end
for k= 1:n
    fprintf(' x[%d]= %f\n' ,k,x(k));
end
