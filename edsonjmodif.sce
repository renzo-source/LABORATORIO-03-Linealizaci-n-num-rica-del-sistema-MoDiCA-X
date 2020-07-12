function xdot=edsonjmodif(u1,u2,u3,u4,u5)
// This is nonlinear Pendulum Model

// Load the parameters
exec('edsonjParametersmodif.sce', -1);

// state variables
x=u1;		
v=u2;
theta=u3;
vartheta=u4;

// control variables
F=u5;	// Fuerza


// Modelo MoDiCA-X
//estado 1-posicion
eta1dot= v;
//estado 2-Velocidad lineal segun estado 1
eta2dot= -((b*v*(I+m*l^2))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))+((F*(I+m*l^2))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))+...
         ((m^2*g*l^2**sin(theta)*cos(theta))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))+((m*l*(vartheta^2)*sin(theta)*(I+m*l^2))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)));

//estado 3-Angulo theta
eta3dot= vartheta;
//estado 4-Velocidad Angular segun estado 3
eta4dot= ((b*v*m*l*cos(theta))/((I+m*l^2)*(M+m)-(m^2*l^2*(cos(theta))^2)))-((F*m*l*cos(theta))/((I+m*l^2)*(M+m)-(m^2*l^2*(cos(theta))^2)))-...
         ((m^2*l^2*vartheta^2*cos(theta)*sin(theta))/((I+m*l^2)*(M+m)-(m^2*l^2*(cos(theta))^2)))-((m*g*l*sin(theta)*(M+m))/((I+m*l^2)*(M+m)-(m^2*l^2*(cos(theta))^2)));

//Salida xdot
xdot =[eta1dot;eta2dot;eta3dot;eta4dot]; 
endfunction
