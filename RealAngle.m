function theta= RealAngle( x, y )
%���ܣ�����һ���������ֵ���ҳ��������[0-360���ȷ�Χ�ڵĽǶ�
%���룺
%       
%      
%�����
%��ע��
%date��
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