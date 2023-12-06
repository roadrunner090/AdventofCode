%AoC6.m

data = importdata('day6puzzleinput.txt');
time = data.data(1,:);
distance = data.data(2,:);

posdistance = zeros(max(time)-1,length(time));

for i = 1:length(time)
       for k = 1:time(i)
        posdistance (k,i) = k*(time(i)-k);
       end    
end

resultsrow = zeros(4,1);
for p = 1:4
resultsrow(p) = sum(posdistance(:,p) > distance(p), 'all');
end

answer = prod(resultsrow, 'all');

%       *signature look of matlab superiority*      %

%% deel2


posdistance = [distance(1) distance(2) distance(3) distance(4)];
strdist = string(posdistance);
strdist2 = append(strdist(1), strdist(2), strdist(3),strdist(4));
posdistance = str2double(strdist2);
time = [time(1) time(2) time(3) time(4)];
strtime = string(time);
strtime2 = append(strtime(1), strtime(2), strtime(3),strtime(4));
time = str2double(strtime2);
distancerecord = posdistance;

%Leuk feitje, ik kon geen ingebouwde functie vinden waar ik N x M double
%arrays kon appenden zoals je dat kan bij strings. Dus daardoor moest ik
%eerst even converten naar string, janken en dan terug vertalen. Mooi
%verhaal, lekker kort ook. 

for i = 1:length(time)
       for k = 1:time(i)
        posdistance (k,i) = k*(time(i)-k);
       end    
end

answer = 0;
for p = 1:length(posdistance)
    if posdistance(p) > distancerecord
    
        answer = answer + 1;
    
    end
end

%Nou ik vond het weer leuk. MATLAB ook, want ez pz dataset. Ok, je hoeft
%het nog niet eens te vragen, jij krijgt een filmpje. 
%
% https://www.youtube.com/watch?v=QdBZY2fkU-0
%
%Die had je al gezien? Oh ja natuurlijk, sorry. Nog een filmpje voor je:
% https://www.youtube.com/watch?v=_YDqm7LXt2g