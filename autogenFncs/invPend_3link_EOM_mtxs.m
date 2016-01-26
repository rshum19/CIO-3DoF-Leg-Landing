function [D_mtx,C_mtx,G_vec,B_mtx] = invPend_3link_EOM_mtxs(q1,q2,q3,x,y,dq1,dq2,dq3,dx,dy,u2,u3,l1,l2,l3,d1,d2,d3,m1,m2,m3,I1,I2,I3,g)
%INVPEND_3LINK_EOM_MTXS
%    [D_MTX,C_MTX,G_VEC,B_MTX] = INVPEND_3LINK_EOM_MTXS(Q1,Q2,Q3,X,Y,DQ1,DQ2,DQ3,DX,DY,U2,U3,L1,L2,L3,D1,D2,D3,M1,M2,M3,I1,I2,I3,G)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    24-Jan-2016 03:09:18

t2 = l1.^2;
t3 = d1.*m1;
t4 = l1.*m2;
t5 = l1.*m3;
t6 = t3+t4+t5;
t7 = q1-q2;
t8 = cos(t7);
t9 = d2.*m2;
t10 = l2.*m3;
t11 = t9+t10;
t12 = l1.*t8.*t11;
t13 = q1-q3;
t14 = cos(t13);
t15 = d3.*l1.*m3.*t14;
t16 = q2-q3;
t17 = cos(t16);
t18 = d3.*l2.*m3.*t17;
t19 = cos(q1);
t20 = t6.*t19;
t21 = cos(q2);
t22 = t11.*t21;
t23 = cos(q3);
t24 = d3.*m3.*t23;
t25 = sin(q1);
t26 = sin(q2);
t27 = sin(q3);
t28 = m1+m2+m3;
D_mtx = reshape([I1+m2.*t2+m3.*t2+d1.^2.*m1,t12,t15,t20,-t6.*t25,t12,I2+d2.^2.*m2+l2.^2.*m3,t18,t22,-t11.*t26,t15,t18,I3+d3.^2.*m3,t24,-d3.*m3.*t27,t20,t22,t24,t28,0.0,-t6.*t25,-t11.*t26,-d3.*m3.*t27,0.0,t28],[5,5]);
if nargout > 1
    t29 = sin(t7);
    t30 = sin(t13);
    t31 = sin(t16);
    C_mtx = reshape([0.0,-dq1.*l1.*t11.*t29,-d3.*dq1.*l1.*m3.*t30,-dq1.*t6.*t25,-dq1.*t6.*t19,dq2.*l1.*t11.*t29,0.0,-d3.*dq2.*l2.*m3.*t31,-dq2.*t11.*t26,-dq2.*t11.*t21,d3.*dq3.*l1.*m3.*t30,d3.*dq3.*l2.*m3.*t31,0.0,-d3.*dq3.*m3.*t27,-d3.*dq3.*m3.*t23,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[5,5]);
end
if nargout > 2
    G_vec = [-g.*t6.*t25;-g.*t11.*t26;-d3.*g.*m3.*t27;0.0;g.*t28];
end
if nargout > 3
    B_mtx = reshape([0.0,1.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0],[5,2]);
end