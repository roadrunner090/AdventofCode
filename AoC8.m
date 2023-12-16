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
tic;
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
    
    toc;
    %% part 2 parsing: 
    
s = 0; %no. of steps
%pos is current index
equalsbit = ' =';
d = 1;

startlocs = sum(contains(maps, 'A ='));


%mapi = 596; %starting map index
b=1;
for i = 1:length(maps)
    if contains(maps{i}, 'A =')
        mapi(b) = i; %starting index
        b=b+1;
    end
end

curmaps = cell(6,1);
for v = 1:length(mapi)
    curmaps{v} = maps{mapi(v)};
end

newpat = cell(startlocs,1);

%% Algorithm part2
%Dit soort while loops zijn heerlijk, moet je eens proberen, dan voel je
%goed van binnen ofzo. 
tic;
s=0;
aa = [0,0,0,0,0,0];
bb = zeros(6,2);
while ~(sum(aa)==2*startlocs)    
    
   if dir(d) == 'L'
       for z = 1:startlocs
            newpat{z} = curmaps{z}(8:10); %new letters
            newpat{z} = append(newpat{z},equalsbit);
       end
   elseif dir(d) == 'R'
       for z = 1:startlocs 
           newpat{z} = curmaps{z}(13:15); %new letters
           newpat{z} = append(newpat{z},equalsbit);
       end
   end
   
    %newpat = append(newpat,equalsbit);
   for x = 1:length(curmaps)
       for b = 1:length(maps)   %for each map, check other maps for new pattern
           if contains(maps{b},newpat{x})
               curmaps{x} = maps{b};    %move to new map
           end
       end
   end
   
   d = d+1;
    if d == 282 %reset dir index if we take many steps lmfao
        d=1;
    end
    
    s = s+1;
    
    for x = 1:length(curmaps)   %ITS BRAND NEW
        if contains(curmaps{x}, 'Z =') && ~(aa(x)==2)
            aa(x) = aa(x) + 1;
            if aa(x) ==1
                bb(x,1) = s; %record step first time
            else
                bb(x,2) = s; %I taunt you a second time
            end
        end
    end    
end
%to do, find LCM (lowest common multiple for each closed loop)

looplengths = bb(:,2)-bb(:,1);
answer = zeros(6,6);
for p = 1:length(looplengths)
    
answer(p,:) = lcm(looplengths(1:6),looplengths(p));

end

%ook iets geleerd, recursion ofzo. Hier was ik lang op vast gebleven want
%matlab lcm for 3 of meer elements is niet ingebouwd, je moet als user
%gewoon number theory kennen om de lcm te berekenen. 
answer = lcm(looplengths(1),(lcm(looplengths(2),(lcm(looplengths(3),(lcm(looplengths(4),(lcm(looplengths(5),looplengths(6))))))))));
toc;