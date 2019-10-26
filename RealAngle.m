function theta= RealAngle( x, y )
%功能：输入一个点的坐标值，找出这个点在[0-360）度范围内的角度
%输入：
%       
%      
%输出：
%备注：
%date：
%%

theta=atand(y/x);
if (x>=0 && y>=0)
    theta=theta;
    else if (x<0 && y>=0)
            theta=180+theta;
            else if (x<0 && y<0)
                    theta=180+theta;
                else
                        theta=360+theta;
                end
        end
end

end