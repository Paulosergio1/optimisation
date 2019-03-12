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
    
    Aircraft =  5;
    Bays     =  4;
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
    
    compliance_arr_dep = zeros(Aircraft,Aircraft);
    compliance_size_bay = zeros(Aircraft,Bays);
    compliance_domestic_bay = zeros(Aircraft,Bays);
    
    for i=1:Aircraft
        for j=1:Aircraft
            if Arrival_time(i)<Arrival_time(j)
                if Departure_time(i)>Arrival_time(j)% && i~=j
                    compliance_arr_dep(i,j)=1;
                end
            else
                if Departure_time(j)>Arrival_time(i) % && i~=j
                    compliance_arr_dep(i,j)=1;
                end
            end
        end
    end
    
    for i=1:Aircraft
        for j=1:Bays
            if Size_ac(i)<Size_Bays(j)
                compliance_size_bay(i,j)=1;
            end
        end
    end
    
    for i=1:Aircraft
        for j=1:Bays
            if Domestic_ac(i) ~= Domestic_Bays(j)
                compliance_domestic_bay(i,j)=1;
            end
        end
    end
     
    
    %%  Initiate CPLEX model
%   Create model
        model                   =   'Bays_assignment';
        cplex                   =   Cplex(model);
        cplex.Model.sense       =   'minimize';

%   Decision variables
        DV                      = (Aircraft * Bays)^2+Aircraft*Bays+penalty_bay+penalty_dom;
    
    %%  Objective Function
        Value_obj=zeros(Aircraft, Bays, Aircraft, Bays);
        DV_obj = string(zeros(Aircraft, Bays, Aircraft, Bays));
        l=1;
        for i =1:Aircraft
            for j = 1:Bays
                for k = 1:Aircraft                     % of the x_{ij}^k variables
                    parfor m = 1:Bays
                        NameDV (i, j, k, m)    = string(['X_i' num2str(i,'%02d') ',j' num2str(j,'%02d') ',i`' num2str(k,'%02d') ',j`' num2str(m,'%02d')]);
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
        
        for i =1:Aircraft
            for j =1:Bays
                NameDV (l,1)    = string(['X_i' num2str(i,'%02d') ',j' num2str(j,'%02d') ]);
                Value_obj(l,1) = 0;
                l=l+1;
            end
        end
        
        NameDV(l,1) = string(['Big_M_bay']);
        Value_obj (l,1) = 1000000;
        l=l+1;
        NameDV(l,:) = string(['Big_M_dom']);
        Value_obj (l,1) = 100000000;
        
        NameDV = char(NameDV);
        
        lb                      =   zeros(DV, 1);                                 % Lower bounds
        ub                      =   ones(DV, 1);                                   % Upper bounds
        ctype                   =   char(ones(1, (DV)) * ('B'));                  % Variable types 'C'=continuous; 'I'=integer; 'B'=binary

       
        % cplex.addCols(obj,A,lb,ub,ctype,name)  http://www-01.ibm.com/support/knowledgecenter/#!/SSSA5P_12.2.0/ilog.odms.cplex.help/Content/Optimization/Documentation/CPLEX/_pubskel/CPLEX1213.html
        cplex.addCols(Value_obj, [], lb, ub, ctype, NameDV);
        cplex.writeModel([model '.lp']);
        
        %%  Constraints
        for i=1:Aircraft
            C_bay_placement=zeros(1,DV);
            for j=1:Bays
                C_bay_placement(varindex_xij(i,j,Bays,Aircraft))=1;
            end
            cplex.addRows(1,C_bay_placement,1,sprintf('Aircraft_bay_assignment_%d',i));
        end
        
        for i=1:Aircraft
            C_bay_Size=zeros(1,DV);
            for j=1:Bays
                C_bay_Size(varindex_xij(i,j,Bays,Aircraft))=compliance_size_bay(i,j);
            end
            cplex.addRows(0,C_bay_Size,0,sprintf('Aircraft_bay_size_%d',i));
        end
        
        for i=1:Aircraft
            C_Domestic=zeros(1,DV);
            for j=1:Bays
                C_Domestic(varindex_xij(i,j,Bays,Aircraft))=compliance_domestic_bay(i,j);
            end
            cplex.addRows(0,C_Domestic,0,sprintf('Aircraft_Domestic_%d',i));  
        end
        
        for i=1:Aircraft
            for k=1:Bays
                for j=1:Aircraft
                    C_timing=zeros(1,DV);
                    C_timing(varindex_xij(j,k,Bays,Aircraft))=compliance_arr_dep(i,j);
                    C_timing(varindex_xij(i,k,Bays,Aircraft))=compliance_arr_dep(i,j);
                    cplex.addRows(0,C_timing,1,sprintf('Aircraft_timing_i%d_i%d_k%d',i,j,k));
                end
            end
        end
        
        for i=1:Aircraft
            for j=1:Bays
                for k=1:Aircraft
                    for o=1:Bays
                        C_passenger=zeros(1,DV);
                        C_passenger(varindex(i,j,k,o,Bays, Aircraft))=-1;
                        C_passenger(varindex_xij(i,j,Bays,Aircraft))=1;
                        C_passenger(varindex_xij(k,o,Bays,Aircraft))=1;
                        if i==k && j==o
                            C_passenger(varindex_xij(k,o,Bays,Aircraft))=2;
                        end
                        cplex.addRows(0,C_passenger,1,sprintf('Passenger_connection%d_%d_%d_%d',i,j,k,o));
                    end
                end
            end
        end
        
        cplex.writeModel([model '.lp']);
       
      

        
     %%  Execute model
        cplex.Param.mip.limits.nodes.Cur    = 1e+11;         %max number of nodes to be visited (kind of max iterations)
        cplex.Param.timelimit.Cur           = 3600*8;         %max time in seconds
        cplex.Param.mip.tolerances.mipgap.Cur   = 0.009;
        
%   Run CPLEX
        cplex.solve();
        cplex.writeModel([model '.lp']);
    
     %%  Postprocessing
%   Store direct results
    status                      =   cplex.Solution.status;
    if status == 101 || status == 102 || status == 105  %http://www.ibm.com/support/knowledgecenter/SSSA5P_12.6.0/ilog.odms.cplex.help/refcallablelibrary/macros/Solution_status_codes.html
        sol.profit      =   cplex.Solution.objval;
        %output          =   transpose(reshape(cplex.Solution.x(varindex_xij(1,1,Bays,Aircraft):varindex_xij(Aircraft,Bays,Bays,Aircraft)),Bays,Aircraft));
        %xlswrite(filn,output,'Solutions')
        Bay_positions=zeros(1,Aircraft);
        for i=1:Aircraft
            positions=cplex.Solution.x(varindex_xij(i,1,Bays,Aircraft):varindex_xij(i,Bays,Bays,Aircraft));
            Bay_positions(1,i)=find(positions(:,1)==1);
        end
        xlswrite(filn,Bay_positions,'Bay_postions')
    end
    
end
function out = varindex(m, n, p, q, Bays, Aircraft)
    out = 1 + (q-1) + (p-1) * Bays + (n-1) * Aircraft * Bays + (m-1) * Bays * Aircraft * Bays; 
    %(m - 1) * Nodes + n + Nodes*Nodes*(p-1);  % Function given the variable index for each DV (i,j,k) [=(m,n,p)]  
          %column       %row   %parallel matrixes (k=1 & k=2)
end

function out = varindex_xij(m, n, Bays, Aircraft)
    out = (Aircraft * Bays)^2 + (m-1)*Bays +n ;
end

function out = varindex_penalty(index, Bays, Aicraft)
    out = (Aircraft * Bays)^2 + Aircraft*Bays +index ;
end

    