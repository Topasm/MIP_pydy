% double_pendulum.al
%-------------------
MOTIONVARIABLES' Q{2}', U{2}'
CONSTANTS L,M,G
NEWTONIAN N
FRAMES A,B
SIMPROT(N, A, 3, Q1)
% -> N_A = [COS(Q1), -SIN(Q1), 0; SIN(Q1), COS(Q1), 0; 0, 0, 1]
SIMPROT(N, B, 3, Q2)
% -> N_B = [COS(Q2), -SIN(Q2), 0; SIN(Q2), COS(Q2), 0; 0, 0, 1]
W_A_N>=U1*N3>
% -> W_A_N> = U1*N3>
W_B_N>=U2*N3>
% -> W_B_N> = U2*N3>
POINT O
PARTICLES P,R
P_O_P> = L*A1>
% -> P_O_P> = L*A1>
P_P_R> = L*B1>
% -> P_P_R> = L*B1>
V_O_N> = 0>
% -> V_O_N> = 0>
V2PTS(N, A, O, P)
% -> V_P_N> = L*U1*A2>
V2PTS(N, B, P, R)
% -> V_R_N> = L*U1*A2> + L*U2*B2>
MASS P=M, R=M
Q1' = U1
Q2' = U2
GRAVITY(G*N1>)
% -> FORCE_P> = G*M*N1>
% -> FORCE_R> = G*M*N1>
ZERO = FR() + FRSTAR()
% -> ZERO[1] = -L*M*(2*G*SIN(Q1)+L*(U2^2*SIN(Q1-Q2)+2*U1'+COS(Q1-Q2)*U2'))
% -> ZERO[2] = -L*M*(G*SIN(Q2)-L*(U1^2*SIN(Q1-Q2)-U2'-COS(Q1-Q2)*U1'))
KANE()
INPUT M=1,G=9.81,L=1
INPUT Q1=.1,Q2=.2,U1=0,U2=0
INPUT TFINAL=10, INTEGSTP=.01
CODE DYNAMICS() some_filename.c
