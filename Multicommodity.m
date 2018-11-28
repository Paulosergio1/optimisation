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

try
    %%  Determine input
%   Select input file and sheet
    filn        =   [pwd '/Input.xlsx'];
    
    Nodes       =   6;
    Classes     =   2;
    
    XX          =   xlsread(filn,1,'B2:B7');
    YY          =   xlsread(filn,1,'C2:C7');
    
    [~,Airport,~]     =   xlsread(filn,1,'A2:A7');  %[NUM,TXT,RAW] check help xlsread
    
    Flow        =   zeros(Nodes,2);
    Flow (:,1)  =   xlsread(filn,1,'D2:D7');
    Flow (:,2)  =   xlsread(filn,1,'E2:E7');
    
    Cost        =   xlsread(filn,1,'B11:G16');
    
    Cap         =   xlsread(filn,1,'B20:G25');

    
    %%  Initiate CPLEX model
%   Create model
        model                   =   'MCF_Model';
        cplex                   =   Cplex(model);
        cplex.Model.sense       =   'minimize';

%   Decision variables
        DV                      = Nodes * Nodes * Classes;
    
    %%  Objective Function
        Cost_OF                 =   zeros(Nodes*Nodes,Classes);                 %Prepare a matrix of OF coefficients
        for k = 1:Classes
            Cost_OF(:,k)        =   reshape(Cost', Nodes*Nodes, 1);
        end
        
        obj                     =   reshape(Cost_OF, Nodes*Nodes*Classes, 1);     % DV coefficients in the OF
        lb                      =   zeros(DV, 1);                                 % Lower bounds
        ub                      =   inf(DV, 1);                                   % Upper bounds
        ctype                   =   char(ones(1, (DV)) * ('I'));                  % Variable types 'C'=continuous; 'I'=integer; 'B'=binary
        
        
        l = 1;                                      % Array with DV names  (OPTIONAL, BUT HELPS READING THE .lp FILE)
        for k =1:Classes
            for i = 1:Nodes
                for j = 1:Nodes                     % of the x_{ij}^k variables
                    NameDV (l,:)  = ['X_' num2str(i,'%02d') ',' num2str(j,'%02d') '_' num2str(k,'%02d')];
                    l = l + 1;
                end
            end
        end
       
        % cplex.addCols(obj,A,lb,ub,ctype,name)  http://www-01.ibm.com/support/knowledgecenter/#!/SSSA5P_12.2.0/ilog.odms.cplex.help/Content/Optimization/Documentation/CPLEX/_pubskel/CPLEX1213.html
        cplex.addCols(obj, [], lb, ub, ctype, NameDV);
        
        
    %%  Constraints
    %   Flow conservation at the nodes          
        for i = 1:Nodes
            for k = 1:Classes
                C1      =   zeros(1, DV);    %Setting coefficient matrix with zeros
                for j = 1:Nodes
                    C1(varindex(i,j,k))   =    1;              %Link getting IN the node
                    C1(varindex(j,i,k))   =   -1;              %Link getting OUT the node
                end
                cplex.addRows(Flow(i,k), C1, Flow(i,k), sprintf('FlowBalanceNode%d_%d',i,k));
            end
        end
        
    %   Capacity per class in each link
        for i = 1:Nodes;
            for j = 1:Nodes;
                C2      =   zeros(1, DV);       %Setting coefficient matrix with zeros
                for k = 1:Classes;
                    C2(varindex(i,j,k))   =   1;      %Only the X_{i,j} (for both k) for the {i,j} pair under consideration
                end
                cplex.addRows(0, C2, Cap(i,j),sprintf('CapacityLink%d_%d_%d',i,j,k));
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
        for k = 1:Classes
            sol.Flow (:,:,k)   =   round(reshape(cplex.Solution.x(varindex(1,1,k):varindex(Nodes, Nodes, k)), Nodes, Nodes))';
        end
    end
%   Write output
    fprintf('\n-----------------------------------------------------------------\n');
    fprintf ('Objective function value:          %10.1f  \n', sol.profit);
    fprintf ('\n') 
    fprintf ('Link     From     To    Flow_Y   Flow_J   Total  (  Cap)    Cost \n');
    NL      =   0;
    for i = 1:Nodes
        for j = 1:Nodes
            if Cost(i,j)<10000
                NL      = NL + 1;
                if sol.Flow(i,j,1)+sol.Flow(i,j,2)>0
                    fprintf (' %2d \t  %s  \t  %s \t  %5d  %5d   %6d  (%5d)   %6d \n', NL, Airport{i}, ...
                                Airport{j}, sol.Flow (i,j,1), sol.Flow (i,j,2), ...
                                sol.Flow (i,j,1)+sol.Flow (i,j,2), Cap(i,j), ...
                                Cost(i,j)*(sol.Flow (i,j,1)+sol.Flow (i,j,2)));
                end
            end
        end
    end
   
end
    function out = varindex(m, n, p)
        out = (m - 1) * Nodes + n + Nodes*Nodes*(p-1);  % Function given the variable index for each DV (i,j,k) [=(m,n,p)]  
              %column       %row   %parallel matrixes (k=1 & k=2)
    end
end
    