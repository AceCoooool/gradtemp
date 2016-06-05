function [len,sq]=recarea(d,l,r,h)
[ftheta,ltheta]=reclimittheta(d,l,r,h);
lmax=sqrt(d^2+l^2);
if ltheta==pi/2
    if lmax>h+r
        len=2*(r/2-63.64)+r;
        sq=(len-r)*r/2;
    elseif lmax<h
        len=0;
        sq=0;
    else
        len=lmax-h+r/2-63.64;
        sq=(lmax-h)*(r/2-63.64);
    end
else
    k=tan(ltheta);
    if ftheta<pi/2   
        p1y=-h;p1x=p1y/k-63.64;
        if -(h+r)/k-63.64>=-r/2  %在里面情况  
            p2y=-h-r;p2x=-(h+r)/k-63.64;
        else   %在外面
            p2x=-r/2;p2y=k*(p2x+63.64);
        end
    else
        p2y=-h-r;p2x=p2y/k-63.64;
        if -h/k-63.64>=-r/2  %里面
            p1y=-h;p1x=p1y/k-63.64;
        else
            p1x=-r/2;p1y=k*(p1x+63.64);
        end
    end
    d1=sqrt((p1x+63.64)^2+p1y^2);d2=sqrt((p2x+63.64)^2+p2y^2);
    if d1>lmax&&d2>lmax
        len=0;sq=0;
    elseif d1<=lmax && d2<=lmax
        len=(p1y-p2y)+r+p1x+p2x;sq=(len-(p1y-p2y))*r/2;
    else
        py=-lmax*sin(ltheta);px=py/k-63.64;
        if r/2>lmax
            len=p1x-px;sq=0;
        else
            len=-py+p1y+r+p1x+px;sq=(px+p1x+r)*(p1y-py)/2;
        end
    end
end
    