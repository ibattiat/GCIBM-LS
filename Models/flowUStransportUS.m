function [StateVar] = flowUStransportUS(StateVar, ControlVar, Flux,...
    DOMAIN, VARIABLES, IBM,IBM_coeffU, IBM_coeffV,IBM_coeffP,BC, LS)

% model 1 : march all 3 eqns together in time

time = ControlVar.time;                
for iTime = 1:ControlVar.noTime
%% =======================================================================
%                       SOLVE FOR FLOW
% ========================================================================
    time = time + VARIABLES.dt;
    fprintf('\n ~~~~~~~~~~~~~~~~~~~~ time = %8.6f ~~~~~~~~~~~~~~~~~~~~~ \n'...
        ,time);
    
    [StateVar,ControlVar, Soln] = ... 
        SolveUVP (ControlVar,Flux,DOMAIN,VARIABLES,StateVar,IBM,IBM_coeffU,...
        IBM_coeffV,IBM_coeffP,BC);  
    disp(ControlVar.messageFlow)
%% ========================================================================
%                       SCALAR TRANSPORT            
%  ========================================================================

    [StateVar] = SolveTransportADRE(ControlVar,DOMAIN,VARIABLES,... 
        StateVar,IBM,IBM_coeffP,BC,Flux, LS);


%% ========================================================================
%                       BREAK if ERROR            
%  ========================================================================
    if sum(sum(isnan(StateVar.U))) || max(max(StateVar.phi))>1e4
        break
    end

end

