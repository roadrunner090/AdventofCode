%AoC10.m

data = fileread('day10puzzleinputformat2.txt');

datarray=char(zeros(140,140));

for i = 1:140
    if i ==1
        datarray(i,:) = data(1:140);
    else
        
        datarray(i,:) = data((140*(i-1)+1):(140*i));
    end
end
tic;

curposx = 80; %columns
curposy = 66; %rows
%Position of 'J' below S for my dataset, a little bit of spoofing.

north = false;
east = false;
south = true;   %initial direction, spoofing part 2.
west = false;
stepcount = 1;  %stepcount starts at 1, since we start at the J below S, which is the first step.

map = datarray;
map(65,80) = 'X'; %S is part of the loop.

stepcoords = zeros(13640,2); %x, y
stepcoords(1,1) = curposx; %initial coors S
stepcoords(1,2) = curposy; 
while ~(datarray(curposy,curposx) == 'S') %kijk en bewonder zou ik zeggen.....
   
    if south
        if (datarray(curposy,curposx)=='|')
            map(curposy,curposx) = 'X';
            curposy = curposy + 1; %we go down 1, state is the same
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='L')
            map(curposy,curposx) = 'X';
            curposx = curposx + 1; %we go right 1, state is now east
            east = true;
            south = false;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='J')
            map(curposy,curposx) = 'X';
            curposx = curposx - 1; %we go left 1, state is now west
            west = true;
            south = false;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
    end
    
    if north
        if (datarray(curposy,curposx)=='|')
            map(curposy,curposx) = 'X';
            curposy = curposy - 1; %we still go north
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='7')
            map(curposy,curposx) = 'X';
            curposx = curposx - 1; %we turn to west from north
            west = true;
            north = false;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='F')
            map(curposy,curposx) = 'X';
            curposx = curposx + 1; %we turn east from north
            east = true;
            north = false;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
    end
    
    if east 
        if (datarray(curposy,curposx)=='-')
            map(curposy,curposx) = 'X';
            curposx = curposx + 1; %we still go east
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='J')
            map(curposy,curposx) = 'X';
            curposy = curposy - 1; %state was east, now we go north
            east = false;
            north = true;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='7')
            map(curposy,curposx) = 'X';
            curposy = curposy + 1; %state was east, now we go south
            east = false;
            south = true;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
    end
    
    if west
        if (datarray(curposy,curposx)=='-')
            map(curposy,curposx) = 'X';
            curposx = curposx - 1; %state was west, still west
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='L')
            map(curposy,curposx) = 'X';
            curposy = curposy - 1; %state was west, now north
            west = false;
            north = true;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
        
        if (datarray(curposy,curposx)=='F')
            map(curposy,curposx) = 'X';
            curposy = curposy + 1;  %state was west, now south
            west = false;
            south = true;
            stepcount = stepcount+1;
            stepcoords(stepcount,1) = curposx;
            stepcoords(stepcount,2) = curposy;
            continue
        end
    end
end

stepcoords(:,2) = 141 - stepcoords(:,2); %kleine conversie naar cartesian coordinates.

stepcoords = cat(1,stepcoords,stepcoords(1,:));

coordsT = stepcoords';

%calculating determinant should give 2x the area. 
 
detmatrix = zeros(length(coordsT)-1,1);

for m = 1:(length(coordsT)-1)
    detmatrix(m) = round(det(coordsT(:,(m:(m+1))))); %ik moest afronden hier idk why something something double double two wrongs make a right 
end

%for loop hierboven gebruikt de som van determinants form van shoelace theorem. Ik wou
%ook proberen om de moker lange determinant uit te rekenen met een andere
%functie dett heette, maar die gaf het verkeerde antwoord. Ik had ook rare
%resultaten dat de determinants die ik berekende niet integers gaf, dus ik
%moet afronden. 

A = abs(0.5*sum(detmatrix)); %we take abs, want waarde was negatief. idk wat ik doe.

boundary = stepcount;

interior = A - boundary/2 + 1; %part 2 answer

answer = stepcount/2; %part 1 answer
toc;

% A = i + b/2 -1  --> Pick's theorem, lekker gewerkt pik
% we hebben al b berekent, dat is stepcount, of boundary points. We zijn
% geinteresseerd in i, interior point. A is area. Dus: i = A - b/2 + 1.
% We moeten A berekenen met de shoelace formula, dan kunnen we interior
% points beredeneren. 





%Hier beneden is teleurstelling.


% 
% for w = 1:140 %loop horizontally
%     startindex=0;
%     curindex=0;
%     if ~((sum(map(w,:)=='X'))==0)
%         for ww = 1:140
%             if (map(w,ww) == 'X') && k == 0
%                 k=1;
%                 startindex = ww;
%             elseif (map(w,ww) == 'X') && ~(k==0)
%                 curindex = ww;
%             end
%         end
%             map(w,1:(startindex-1))='0';
%             map(w,(curindex+1):140)='0';
%     else
%         map(w,:)='0';
%     end
%     k=0;
% end
% k=0;
% startindex = 0;
% curindex = 0;
% for h = 1:140 %loop vertically
%     if ~((sum(map(:,h)=='X'))==0)
%         for hh = 1:140
%             if (map(hh,h) == 'X') && k == 0
%                 k=1;
%                 startindex = hh;
%             elseif (map(hh,h) == 'X') && ~(k==0)
%                 curindex = hh;
%             end
%         end
%             map(1:(startindex-1),h)='0';
%             map((curindex+1):140,h)='0';
%     else
%         map(:,h)='0';
%     end
%     k=0;
% end
% 
% % we hebben nu nog sommige uitstekels...
% 
% for c = 1:10 %we gaan hier meerdere keren doorheen want beun
% for a = 2:139
%     for b=2:139
%         if ~((map(a,b)=='X')||(map(a,b)=='0'))
%             if (map(a+1,b)=='0')||(map(a-1,b)=='0')||(map(a,b+1)=='0')||(map(a,b-1)=='0')||(map(a+1,b+1)=='0')||(map(a-1,b+1)=='0')||(map(a-1,b+1)=='0')||(map(a-1,b-1)=='0')
%                 map(a,b)='0';
%             end
%         end
%     end
% end
% end
% 
% 
% totalarea=140*140;
% nozero = sum(sum(map=='0'));
% noX = sum(sum(map=='X'));
% tilesleft = totalarea-nozero-noX;


