//valores Linealizados modificado del paper INVERTED PENDULUM 

// Load the parameters
exec('edsonjParametersmodif.sce', -1);


Aa=[0                   1                                          0                               0;
   0     -((b*(I+m*l^2))/((I+m*l^2)*(M+m)-m^2*l^2)) ((m^2*l^2*g)/((I+m*l^2)*(M+m)-m^2*l^2))        0;
   0                    0                                          0                               1;
   0     -((b*m*l)/((I+m*l^2)*(M+m)-m^2*l^2))       ((m*g*l*(M+m))/((I+m*l^2)*(M+m)-m^2*l^2))      0];
   
Ba=[                    0                     ;
         ((I+m*l^2)/((I+m*l^2)*(M+m)-m^2*l^2));
                        0                     ;
         ((m*l)/((I+m*l^2)*(M+m)-m^2*l^2))]   ;
   
Ca=[1    0     0      0;
    0    0     1     0];
  
Da=[0;
   0];
   
sysa=syslin('c', Aa, Ba, Ca, Da);
// save the data
save("edsonjLTIanalitmodif.sod","sysa")
