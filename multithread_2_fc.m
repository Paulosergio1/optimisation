function Multicommodity ()
%%  Initialization
    addpath('C:\Program Files\IBM\ILOG\CPLEX_Studio128\cplex\matlab\x64_win64');
    savepath
    addpath('C:\Program Files\IBM\ILOG\CPLEX_Studio128\cplex\examples\src\matlab');
    savepath
    clc
	clearvars
    close all
    warning('off','MATLAB:lang:badlyScopedReturnValue')
    warning('off','MATLAB:xlswrite:NoCOMServer')

    %%  Determine input
%   Select input file and sheet
    filn        =   [pwd '/Operations.xlsx'];
    
    Aircraft =  3;
    Bays     =  3;
    slack    = Aircraft*Bays;
    penalty_bay  = 1;
    penalty_dom  = 1;
    
    Arrival_time        =   xlsread(filn,'Aircraft','B2:B62');
    Departure_time      =   xlsread(filn,'Aircraft','C2:C62');
    Size_ac             =   xlsread(filn,'Aircraft','D2:D62');
    Domestic_ac         =   xlsread(filn,'Aircraft','E2:E62');
    
    Size_Bays           =   xlsread(filn,'Bays','C2:C45');
    Domestic_Bays       =   xlsread(filn,'Bays','E2:E45');
    
    connections     =   xlsread(filn,'Connections','C3:BK63');
    
    walking_time        =   xlsread(filn,'walking time','C4:AT47');
    
    
    %%  Initiate CPLEX model
%   Create model
        model                   =   'Bays_assignment';
        cplex                   =   Cplex(model);
        cplex.Model.sense       =   'minimize';

%   Decision variables
        DV                      = (Aircraft * Bays)^2+slack+penalty_bay+penalty_dom;
    
    %%  Objective Function
        Value_obj=zeros(Aircraft, Bays, Aircraft, Bays);
        DV_obj = string(zeros(Aircraft, Bays, Aircraft, Bays));
        l=1;
        for i =1:Aircraft
            for j = 1:Bays
                for k = 1:Aircraft                     % of the x_{ij}^k variables
                    parfor m = 1:Bays
                        NameDV (i, j, k, m)    = string(['X_(ac1)' num2str(i,'%02d') ',(bay1)' num2str(j,'%02d') '_(ac2)' num2str(k,'%02d') '_(bay2)' num2str(m,'%02d')]);
                        if Departure_time(k)>Arrival_time(i)
                            Value_obj(i,j,k,m) = (1+1/(Departure_time(k)-Arrival_time(i)))*connections(i,k)*walking_time(j,m);
                        end
                        l=l+1;
                    end
                end
            end
        end
        
        NameDV = permute(NameDV,[4,3,2,1]);
        NameDV = reshape(NameDV, (Aircraft*Bays)^2, 1);
        
        Value_obj = permute(Value_obj,[4,3,2,1]);
        Value_obj = reshape(Value_obj, (Aircraft*Bays)^2, 1);
        
        for i =1:slack
            %NameDV (l,:)    = ['Slack' num2str(i,'%02d')];
            NameDV (l,1)    = string(['Slack' num2str(i,'%02d') '                            ']);
            Value_obj(l,1) = 0;
            l=l+1;
        end
        
        NameDV(l,1) = string(['Penalty_bay' num2str(1,'%02d') '                      ']);
        Value_obj (l,1) = 1000000;
        l=l+1;
        NameDV(l,:) = string(['Penalty_dom' num2str(2,'%02d') '                      ']);
        Value_obj (l,1) = 1000000000;
        
        NameDV = char(NameDV);
        
        lb                      =   zeros(DV, 1);                                 % Lower bounds
        ub                      =   ones(DV, 1);                                   % Upper bounds
        ctype                   =   char(ones(1, (DV)) * ('I'));                  % Variable types 'C'=continuous; 'I'=integer; 'B'=binary

       
        % cplex.addCols(obj,A,lb,ub,ctype,name)  http://www-01.ibm.com/support/knowledgecenter/#!/SSSA5P_12.2.0/ilog.odms.cplex.help/Content/Optimization/Documentation/CPLEX/_pubskel/CPLEX1213.html
        cplex.addCols(Value_obj, [], lb, ub, ctype, NameDV);
        cplex.writeModel([model '.lp']);
        
        %%  Constraints
        %One bay per A/C
        for i=1:Aircraft
            for j=1:Bays
                C_bays=zeros(1,DV);
                for k=1:Aircraft
                    for o=1:Bays
                        C_bays(varindex(i,j,k,o,Bays, Aircraft))=1;
                    end
                end
                C_bays(varindexslack(i,j,Bays, Aircraft))=-Aircraft;
                cplex.addRows(0,C_bays,0,sprintf('Onebayperaircraft_ac_bay%d_%d',i,j));
            end
        end
        
       
        % Slack variable one bay per aircraft
        for i=1:Aircraft
            C_slack_bays=zeros(1,DV);
            for j=1:Bays
                C_slack_bays(varindexslack(i,j,Bays, Aircraft))=1;
            end
            cplex.addRows(1,C_slack_bays,1,sprintf('Slack_Onebayperaircraft_ac_bay%d',i));
        end
        
        
        %Aircraft should depart from the same bay as it departed from
        for i=1:Aircraft
            for j=1:Bays
                C_Same_bay_Arr_Dep=zeros(1,DV);
                for k=1:Aircraft
                    for u=1:Bays
                        C_Same_bay_Arr_Dep(varindex(i,j,k,u,Bays, Aircraft))=1;
                        C_Same_bay_Arr_Dep(varindex(k,u,i,j,Bays, Aircraft))=-1;
                        if i==k && j==u
                            C_Same_bay_Arr_Dep(varindex(i,j,k,u,Bays, Aircraft))=0;
                        end
                    end
                end
                cplex.addRows(0,C_Same_bay_Arr_Dep,0,sprintf('Same_bay_Arr_Dep%d_%d',i,j));
            end
        end
        
        cplex.writeModel([model '.lp']);
        
        %one connection between two aircraft
        for i=1:Aircraft
            for j=1:Aircraft
                C_connect_aircraft=zeros(1,DV);
                for k=1:Bays
                    for r=1:Bays
                        C_connect_aircraft(varindex(i,k,j,r,Bays, Aircraft))=1;
                    end
                end
                cplex.addRows(1,C_connect_aircraft,1,sprintf('Connection_between_aircraft%d_%d',i,j));
            end
        end
        
        %The aircraft should not be parked at a bay which is to small,
        %otherwise there is a penalty value.
        for i=1:Aircraft
            for j=1:Bays
                C_bays=zeros(1,DV);
                for k=1:Aircraft
                    for t=1:Bays
                        C_bays(varindex(i,j,k,t,Bays, Aircraft))=1;
                    end
                end
                C_bays(varindexslack(i,j,Bays, Aircraft))=-Aircraft;
                cplex.addRows(0,C_bays,0,sprintf('Onebayperaircraft_ac_bay%d_%d',i,j));
            end
        end
        
        
        
        for i=1:Aircraft
            for j=1:Bays
                C_bay_size=zeros(1,DV);
                for k=1:Aircraft
                    for y=1:Bays
                        C_bay_size(varindex(i,j,k,y,Bays, Aircraft))=1;
                    end
                end
                C_bay_size(end-1)=-Aircraft;
                if Size_Bays(j)>Size_ac(i)
                    cplex.addRows(-Aircraft,C_bay_size,0,sprintf('Bays_size%d_%d_%d_%d',i,j));
                end
            end
        end
        
        for i=1:Aircraft
            for j=1:Bays
                C_domestic=zeros(1,DV);
                for k=1:Aircraft
                    for y=1:Bays
                        C_domestic(varindex(i,j,k,y,Bays, Aircraft))=1;
                    end
                end
                C_domestic(end)=-Aircraft;
                if Domestic_Bays(j)~=Domestic_ac(i)
                    cplex.addRows(-Aircraft,C_domestic,0,sprintf('Domestic_bay%d_%d_%d_%d',i,j));
                end
            end
        end
        
        %arrival and departure time constraint
        for i=1:Aircraft
            for j=(i+1):Aircraft
                if Arrival_time(j)<= Departure_time(i)
                    for k=1:Bays
                        C_time=zeros(1,DV);
                        for z=1:Bays
                            C_time(varindex(i,k,j,z,Bays,Aircraft))=1;
                            C_time(varindex(j,k,i,z,Bays,Aircraft))=1;
                        end
                        cplex.addRows(0,C_time,1,sprintf('Conflicting_times_%d_%d_%d_%d',i,j,k,z));
                    end
                end
            end
        end
      

        
     %%  Execute model
        cplex.Param.mip.limits.nodes.Cur    = 1e+8;         %max number of nodes to be visited (kind of max iterations)
        cplex.Param.timelimit.Cur           = 3600;         %max time in seconds
        
%   Run CPLEX
        cplex.solve();
        cplex.writeModel([model '.lp']);
    
     %%  Postprocessing
%   Store direct results
    status                      =   cplex.Solution.status;
    if status == 101 || status == 102 || status == 105  %http://www.ibm.com/support/knowledgecenter/SSSA5P_12.6.0/ilog.odms.cplex.help/refcallablelibrary/macros/Solution_status_codes.html
        sol.profit      =   cplex.Solution.objval;
        output          =   reshape(cplex.Solution.x(1:(Aircraft*Bays)^2),Aircraft*Bays,Aircraft*Bays);
        xlswrite(filn,output,'Solutions')
        Bay_positions=zeros(1,Aircraft);
        ac_count=1;
        for i=1:Bays
            if sum(output(i,:))~=0
                for j=1:Aircraft*Bays
                    if output(i,j)~=0
                        Bay_positions(1,ac_count)=j-(ac_count-1)*Bays;
                        ac_count=ac_count+1;
                    end
                end
            end
        end            
        xlswrite(filn,Bay_positions,'Bay_postions')
    end
    
end
function out = varindex(m, n, p, q, Bays, Aircraft)
    out = 1 + (q-1) + (p-1) * Bays + (n-1) * Aircraft * Bays + (m-1) * Bays * Aircraft * Bays; 
    %(m - 1) * Nodes + n + Nodes*Nodes*(p-1);  % Function given the variable index for each DV (i,j,k) [=(m,n,p)]  
          %column       %row   %parallel matrixes (k=1 & k=2)
end

function out = varindexslack(m, n, Bays, Aircraft)
    out = (Aircraft * Bays)^2 + (m-1)*Aircraft +n ;
end

    