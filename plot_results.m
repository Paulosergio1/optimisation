%CHANGE THE VALUE FOR BAYS
number_bays=2;
Baynumbers=ones(1,number_bays);
for i=1:number_bays
    Baynumbers(1,i)=i;
end


filn        =   [pwd '/Operations.xlsx'];
total_time  =   8;

AC_bay           =   xlsread(filn,'Bay_postions','A1:BA1');
Arrival_time        =   xlsread(filn,'Aircraft','B2:B62');
Departure_time      =   xlsread(filn,'Aircraft','C2:C62');


used_bays=zeros(1,number_bays);
for i=1:number_bays
    used_bays(1,i)=sum((i==AC_bay));
end
number_gaps=max(used_bays)+1;
number_jobs=max(used_bays);
Data_matrix=zeros(number_bays,(number_gaps+number_jobs));
Name_matrix=string(zeros(size(Data_matrix)));



for i=1:number_bays
    indexes_of_ac=find(AC_bay==i);
    for j=1:length(indexes_of_ac)
        Data_matrix(i,2*j-1)=Arrival_time(indexes_of_ac(j))-sum(Data_matrix(i,1:2*j-2));
        Data_matrix(i,2*j)=Departure_time(indexes_of_ac(j))-Arrival_time(indexes_of_ac(j));
        name=string(["AC " num2str(indexes_of_ac(j),'%02d')]);
        Name_matrix(i,2*j)=strcat(name(1),name(2));
    end
    Data_matrix(i,end)=total_time-sum(Data_matrix(i,1:end-1));
end

for j=1:length(Name_matrix(:,1))
    for i=1:length(Name_matrix(j,:))
        if Name_matrix(j,i)=="0"
            Name_matrix(j,i)="";
        end
    end
end

plot=barh(Baynumbers,Data_matrix,'stacked');
for i=1:2:length(Data_matrix(1,:))
    plot(i).FaceColor = 'white';
    plot(i).EdgeColor = 'white';
end
for i=2:2:length(Data_matrix(1,:))
    plot(i).FaceColor = 'yellow';
    plot(i).EdgeColor = 'black';
end

for i=1:length(Data_matrix(:,1))
    for j=1:length(Data_matrix(1,2:end))
        text_location=sum(Data_matrix(i,1:j))-0.5*Data_matrix(i,j);
        text(text_location,i,Name_matrix(i,j),...
  'HorizontalAlignment','center');
    end
end

xlabel('time (hours)') 
ylabel('Bay number') 


