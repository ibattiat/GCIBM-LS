function [IBM_coeffU,IBM_coeffV,IBM_coeffP] = LSIBMcoeffs(IBM,DOMAIN,LS, phi)
%phi_inside_u,phi_inside_phi)

 
% for u-velocity

UVP = -1;

[landa_u,landa_g_1_u,landa_g_2_u,landa_g_3_u,landa_g_4_u,A1_g_u,numg_u,...
    flag_u,I_g_u,J_g_u,I_solid_u,J_solid_u,I_e_u,J_e_u,...
    I1_u,J1_u,I2_u,J2_u,I3_u,J3_u,I4_u,J4_u,...
    landa_g_5_u,landa_g_6_u,I5_u,J5_u,I6_u,J6_u,nx_u,ny_u]=...
                 LSPointIdent(DOMAIN,IBM.alpha,IBM.beta,IBM.q,...
                 IBM.BQu,LS,UVP, phi, IBM.treshold);

             

% for v-velocity



UVP = 0;

[landa_v,landa_g_1_v,landa_g_2_v,landa_g_3_v,landa_g_4_v,A1_g_v,numg_v,...
    flag_v,I_g_v,J_g_v,I_solid_v,J_solid_v,I_e_v,J_e_v,...
    I1_v,J1_v,I2_v,J2_v,I3_v,J3_v,I4_v,J4_v,...
    landa_g_5_v,landa_g_6_v,I5_v,J5_v,I6_v,J6_v,nx_v,ny_v]=...
                 LSPointIdent(DOMAIN,IBM.alpha,IBM.beta,IBM.q,...
                 IBM.BQv,LS,UVP, phi, IBM.treshold);



% for p and scalar 


UVP = 1;

[landa_p,landa_g_1_p,landa_g_2_p,landa_g_3_p,landa_g_4_p,A1_g_p,numg_p,...
    flag_p,I_g_p,J_g_p,I_solid_p,J_solid_p,I_e_p,J_e_p,...
    I1_p,J1_p,I2_p,J2_p,I3_p,J3_p,I4_p,J4_p,...
    landa_g_5_p,landa_g_6_p,I5_p,J5_p,I6_p,J6_p,nx_p,ny_p]=...
                 LSPointIdent(DOMAIN,IBM.alpha_phi,...
                   IBM.beta_phi,IBM.q_phi,IBM.BQp,LS,UVP, phi, IBM.treshold);


          
if IBM.BQu == 1 

               
    IBM_coeffU = struct('landa_u',landa_u,'landa_g_1_u',landa_g_1_u,...
        'landa_g_2_u',landa_g_2_u,'landa_g_3_u',landa_g_3_u,...
        'landa_g_4_u',landa_g_4_u,'landa_g_5_u',landa_g_5_u,...
        'landa_g_6_u',landa_g_6_u,'A1_g_u',A1_g_u,...
        'numg_u',numg_u,'flag_u',flag_u,'I_g_u',I_g_u,'J_g_u',J_g_u,...
        'I_solid_u',I_solid_u,'J_solid_u',J_solid_u,'I_e_u',I_e_u,...
        'J_e_u',J_e_u,'I1_u',I1_u,'J1_u',J1_u,'I2_u',I2_u,'J2_u',J2_u,...
        'I3_u',I3_u,'J3_u',J3_u,'I4_u',I4_u,'J4_u',J4_u,'I5_u',I5_u,...
        'J5_u',J5_u,'I6_u',I6_u,'J6_u',J6_u,'nx_u',nx_u,'ny_u',ny_u);
    
elseif IBM.BQu == 0
    
    IBM_coeffU = struct('landa_u',landa_u,'landa_g_1_u',landa_g_1_u,...
        'landa_g_2_u',landa_g_2_u,'landa_g_3_u',landa_g_3_u,...
        'landa_g_4_u',landa_g_4_u,'A1_g_u',A1_g_u,...
        'numg_u',numg_u,'flag_u',flag_u,'I_g_u',I_g_u,'J_g_u',J_g_u,...
        'I_solid_u',I_solid_u,'J_solid_u',J_solid_u,'I_e_u',I_e_u,...
        'J_e_u',J_e_u,'I1_u',I1_u,'J1_u',J1_u,'I2_u',I2_u,'J2_u',J2_u,...
        'I3_u',I3_u,'J3_u',J3_u,'I4_u',I4_u,'J4_u',J4_u,...
        'nx_u',nx_u,'ny_u',ny_u);
    
end


if IBM.BQv == 1
    
    IBM_coeffV = struct('landa_v',landa_v,'landa_g_1_v',landa_g_1_v,...
        'landa_g_2_v',landa_g_2_v,'landa_g_3_v',landa_g_3_v,...
        'landa_g_4_v',landa_g_4_v,'landa_g_5_v',landa_g_5_v,...
        'landa_g_6_v',landa_g_6_v,'A1_g_v',A1_g_v,...
        'numg_v',numg_v,'flag_v',flag_v,'I_g_v',I_g_v,'J_g_v',J_g_v,...
        'I_solid_v',I_solid_v,'J_solid_v',J_solid_v,'I_e_v',I_e_v,...
        'J_e_v',J_e_v,'I1_v',I1_v,'J1_v',J1_v,'I2_v',I2_v,'J2_v',J2_v,...
        'I3_v',I3_v,'J3_v',J3_v,'I4_v',I4_v,'J4_v',J4_v,'I5_v',I5_v,...
        'J5_v',J5_v,'I6_v',I6_v,'J6_v',J6_v,'nx_v',nx_v,'ny_v',ny_v);
    
elseif IBM.BQv == 0
    
    IBM_coeffV = struct('landa_v',landa_v,'landa_g_1_v',landa_g_1_v,...
        'landa_g_2_v',landa_g_2_v,'landa_g_3_v',landa_g_3_v,...
        'landa_g_4_v',landa_g_4_v,'A1_g_v',A1_g_v,...
        'numg_v',numg_v,'flag_v',flag_v,'I_g_v',I_g_v,'J_g_v',J_g_v,...
        'I_solid_v',I_solid_v,'J_solid_v',J_solid_v,'I_e_v',I_e_v,...
        'J_e_v',J_e_v,'I1_v',I1_v,'J1_v',J1_v,'I2_v',I2_v,'J2_v',J2_v,...
        'I3_v',I3_v,'J3_v',J3_v,'I4_v',I4_v,'J4_v',J4_v...
        ,'nx_v',nx_v,'ny_v',ny_v);
end


if IBM.BQp ==1
    
    IBM_coeffP = struct('landa_p',landa_p,'landa_g_1_p',landa_g_1_p,...
        'landa_g_2_p',landa_g_2_p,'landa_g_3_p',landa_g_3_p,...
        'landa_g_4_p',landa_g_4_p,'landa_g_5_p',landa_g_5_p,...
        'landa_g_6_p',landa_g_6_p,'A1_g_p',A1_g_p,...
        'numg_p',numg_p,'flag_p',flag_p,'I_g_p',I_g_p,'J_g_p',J_g_p,...
        'I_solid_p',I_solid_p,'J_solid_p',J_solid_p,'I_e_p',I_e_p,...
        'J_e_p',J_e_p,'I1_p',I1_p,'J1_p',J1_p,'I2_p',I2_p,'J2_p',J2_p,...
        'I3_p',I3_p,'J3_p',J3_p,'I4_p',I4_p,'J4_p',J4_p,'I5_p',I5_p,...
        'J5_p',J5_p,'I6_p',I6_p,'J6_p',J6_p,'nx_p',nx_p,'ny_p',ny_p);
    
elseif IBM.BQp == 0
    
    IBM_coeffP = struct('landa_p',landa_p,'landa_g_1_p',landa_g_1_p,...
        'landa_g_2_p',landa_g_2_p,'landa_g_3_p',landa_g_3_p,...
        'landa_g_4_p',landa_g_4_p,'A1_g_p',A1_g_p,...
        'numg_p',numg_p,'flag_p',flag_p,'I_g_p',I_g_p,'J_g_p',J_g_p,...
        'I_solid_p',I_solid_p,'J_solid_p',J_solid_p,'I_e_p',I_e_p,...
        'J_e_p',J_e_p,'I1_p',I1_p,'J1_p',J1_p,'I2_p',I2_p,'J2_p',J2_p,...
        'I3_p',I3_p,'J3_p',J3_p,'I4_p',I4_p,'J4_p',J4_p...
        ,'nx_p',nx_p,'ny_p',ny_p);
    
end

