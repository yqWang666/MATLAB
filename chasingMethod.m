function output = chasingMethod(a, b, c, f)
%%%���ܣ��������Խ����Է�������¶Խ���a,���Խ���b���϶Խ���c�����f,������̵Ľ�x
%%%��������ʽ��{b1   c1                             }  { x1     }    { f1     }
%%%           {a1   b2    c2                       }  { x2     }    { f2     }
%%%           {      a2    b3    c3                }* { x3     } =  { f3     }
%%%           {                .....               }  {  .     }    { .      }
%%%           {              a(n-1) b(n-1) c(n-1)  }  { x(n-1) }    { f(n-1) } 
%%%           {                      a(n)     b(n) }  { x(n)   }    { f(n)   }
%%%��ע��b��f����n��Ԫ�أ�a��c����n-1��Ԫ��           
%date:2018/07/06
%%

N = length(b);
alpha=zeros(1,N);
beta=zeros(1,N-1);
r=a;
alpha(1)=b(1); beta(1)=c(1)/alpha(1);
for i=2:N-1
    alpha(i)=b(i)-r(i-1)*beta(i-1);
    beta(i)=c(i)/alpha(i);
end
alpha(end)=b(end)-r(end)*beta(end);
y=zeros(1,N);
y(1)=f(1)/alpha(1);
for i=2:N
    y(i)=(f(i)-r(i-1)*y(i-1))/alpha(i);
end
x=zeros(1,N);
x(end)=y(end);  
for i=N-1:-1:1      
    x(i)=y(i)-beta(i)*x(i+1);
end
output=x;

end

%%
%%%��ѧԭ��
%   {b1   c1                             }  { x1     }    { f1     }
%   {a1   b2    c2                       }  { x2     }    { f2     }
%   {      a2    b3    c3                }* { x3     } =  { f3     }
%   {                .....               }  {  .     }    { .      }
%   {              a(n-1) b(n-1) c(n-1)  }  { x(n-1) }    { f(n-1) } 
%   {                      a(n)     b(n) }  { x(n)   }    { f(n)   }
%%%LU�ֽ⣺
%   {alpha(1)                                                    }   {1  beta(1)                                         }
%   {  r(1)     alpha(2)                                         }   {      1     beta(2)                                }
%   {             r(2)     alpha(3)                              }*  {               1      beta(3)                      } 
%   {                           .....                            }   {                          .....                    } 
%   {                            r(n-1)     alpha(n-1)  }        }   {                             1     beta(n-1)       }  
%   {                                          r(n)     alpha(n) }   {                                    1      beta(n) } 
%%%�ϲ�������Ķ�Ӧ��⣺   
%   {alpha(1)       alpha(1)*beta(1)                                                                                               }  
%   {  r(1)       r(2)*beta(1)+alpha(2)       alpha(2)*beta(2)                                                                     } 
%   {                    r(2)       r(3)*beta(2)+alpha(3)          alpha(3)*beta(3)                                                }   
%   {                                                       .....                                                                  }          
%   {                                 r(i)        r(i)*beta(i-1)+alpha(i)         alpha(i)*beta(i)                                 }      
%   {                                                                      .....                                                   }  
%   {                                                        r(n-1)     r(n-1)*beta(n-2)alpha(n-1)    alpha(n-1)*beta(n-1)         } 
%   {                                                                         r(n)                    r(n)*beta(n-1)+alpha(n)      }
%%%���˳��
%����r(i),alpha(i),beta(i)
%   r(i)=a(i)                             ( i=1,2,3....(n_1) )
%   alpha(1)=b(1)   beta(1)=c(1)/alpha(1)
%
%   alpha(i)=b(i)-r(i-1)*beta(i-1)
%   beta(i)=c(i)/alpha(i)                 ( i=2,3,4,.....(n-1) )       
%
%   alpha(n)=b(n)-r(n-1)*beta(n-1)
%
%����y��
%   y(1)=f(1)/alpha(1)
%   y(i)=(f(i)-r(i-1)*y(i-1))/alpha(i)      ( i=2,3,4,....(n) )
%
%���õ������
%   x(n)=y(n)
%   x(i)=y(i)-beta(i)*x(i)                ( i=(n-1),(n-2),.....1 )
%