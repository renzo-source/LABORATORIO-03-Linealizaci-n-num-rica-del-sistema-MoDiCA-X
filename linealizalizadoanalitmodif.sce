//valores Linealizados analiticamente caso del pendulo paper

// Load the parameters
exec('edsonjParametersmodif.sce', -1);


Aa=[0 1 0 0;...
   0 -((b*(I+m*l^2))/((M+m)*(I+m*l^2)-m^2*l^2)) ((m^2*l^2*g)/((M+m)*(I+m*l^2)-m^2*l^2)) 0;...
   0 0 0 1;...
   0 -((b*m*l)/((M+m)*(I+m*l^2)-m^2*l^2)) ((m*g*l*(M+m))/((M+m)*(I+m*l^2)-m^2*l^2)) 0];
   
Ba=[0;...
   ((I+m*l^2)/((M+m)*(I+m*l^2)-m^2*l^2));...
   0;...
   ((m*l)/((M+m)*(I+m*l^2)-m^2*l^2))];
   
Ca=[1 0 0 0;
   0 0 1 0];
  
Da=[0;
   0];
   
sysa=syslin('c', Aa, Ba, Ca, Da);
// save the data
save("edsonjLTIanalitmodif.sod","sysa")
