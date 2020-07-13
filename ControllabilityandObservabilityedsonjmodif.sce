// load the data
load("edsonjLTImodif.sod","X","U","sys")
// load the data
load("edsonjLTIanalitmodif.sod","sysa")

// obtaingin the matrices A,B,C,D
A=sys.A
B=sys.B
C=sys.C
D=sys.D

//matrices Aa,Ba,Ca,Da de forma linealizada
Aa=sysa.A
Ba=sysa.B
Ca=sysa.C
Da=sysa.D

// pregunta 7 Controllability and Observability 
// Cc=[B, AB, A^2 B,..., A^(n-1) B]
Cc = cont_mat(A,B)
rankCc=rank(Cc)
//
// O=[C; CA; CA^2;...; CA^(n-1) ]
O = obsv_mat(A, C)
rankO=rank(O)
// verify if the rank of Cc is n, dimension of a
// verify if the rank of O is n, dimension of a

/*                  Plotear valores singulares del modelo LTI                    */
G = syslin('c', A, B, C, D);
tr = trzeros(G)

w = logspace(-3,3);
sv = svplot(G,w);

//valores de forma analitica
Ga = syslin('c', Aa, Ba, Ca, Da);
tra = trzeros(Ga)
wa = logspace(-3,3);
sva = svplot(Ga,wa);

scf(1);
plot2d("ln", w, [20*log(sv')/log(10), 20*log(sva')/log(10)])
xgrid(12)
xtitle("Singular values plot","Frequency (rad/s)", "Amplitude(dB)");

/*                         Scaling                                */

//polos y zeros del modelo de forma analitica
scf(2);
plzr(sysa);


//polos y zeros del modelo linealizado
scf(3);
plzr(sys);


//funcion de transferencia del modelo analitico y modelo linealizado

[h]=ss2tf(sys)
[ha]=ss2tf(sysa)
