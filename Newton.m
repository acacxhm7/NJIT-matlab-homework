eps= 5e-6;
delta= 1e-6;
N = 100;
k=0;
x0 =1.0;
while( 1)
    x1 = x0- func2_2(x0)/func2_2_1(x0);
    k = k+1;
    if(k> N | abs(x1) < eps)
        disp( 'Newton method failed');
	break;
    end
    if abs(x1) < 1
        d= x1 - x0;
    else
	d= (x1- x0)/x1;
    end
    x0 = x1;
    if(abs(d) < eps|abs(func2_2(x1)) < delta)
	break; 
    end
end
fprintf('%f',x0);

function y= func2_2_1(x)
    y = 2*x-exp(x);
end
function y = func2_2(x)
y= x*x-exp(x);
end
