%AoC8.m
%"Ik ga proberen nu mooi te programmeren" --> Leugens die ik aan mezelf
%vertel voordat ik jullie teleurstel.
clc;

data = importdata("day8puzzleinput.txt");

dir = data{1};  
%^^direction instruction set, can be extended arbitrarily with 
%indices methinks, so check if 282, then do reset or something. 
maps = cell(738,1);
for v = 1:(length(data)-1)
maps{v} = data{v+1};
end

%mapi = 596; %starting map index
for i = 1:length(maps)
    if contains(maps{i}, 'AAA =')
        mapi = i; %starting index
    end
end
curmap = maps{mapi};
 %mappat is going to be the mappattern we are looking for. 

%% Algorithm part1
s = 0; %no. of steps
%pos is current index
equalsbit = ' =';
d = 1;
while ~contains(curmap, 'ZZZ =')
    
   if dir(d) == 'L'
    newpat = curmap(8:10); %new letters
   elseif dir(d) == 'R'
    newpat = curmap(13:15);
   end
   
    newpat = append(newpat,equalsbit);
    
   for b = 1:length(maps)   %check other maps for new pattern
        if contains(maps{b},newpat)
            curmap = maps{b};    %move to new map
        end
   end
    d = d+1;    
    if d == 282 %reset dir index if we take many steps lmfao
        d=1;
    end
    
    s = s+1;
end
    %filmpje voor de liefhebbers: https://www.youtube.com/watch?v=uWXxlYzBCno
    %Dit filmpje is best wel creepy maar kan grappig zijn. 