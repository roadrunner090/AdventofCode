%AoC4.m
clc;
tic;

data = importdata('day4puzzleinput.txt');
char
for i = 1:length(data)
    for p = 1:116
    prodata(i,p) = data{i}(p);  %mikey, we went indexing
        %SHIT BONO, he rammed into me
        %I need to learn how to pre allocate a char array properly, i don't
        %get it
    end
end

%11:39 is winning numbers
%43:116 are numbers we have (OH LAWD HE COMIN')
winning = zeros(193,10);
having = zeros(193,25);

for h = 1:length(data)
winning(h,:) = sscanf(prodata(h,11:39),'%d');
having(h,:) = sscanf(prodata(h,43:116),'%d');
end

for z = 1:length(data)  %z cause i'm sleepin
   wincountrow(z,:) = ismember(having(z,:),winning(z,:));
end

sumwincount = zeros(193,1);
for a = 1:length(data)
sumwincount(a) = sum(wincountrow(a,:));
end

pointsrow = zeros(193,1);
for b = 1:length(data)      
    %Jesus Christ I am addicted to for loops. I could learn better syntax
    %maar boeie
    if sumwincount(b) == 0
        continue
    else
        
    pointsrow(b) = 2^(sumwincount(b)-1);

    end
end

finalanswer = sum(pointsrow);
% LMFAO MATLAB was made for this shit. TIME TO GO TO part 2!
% time taken: 0.028965 seconds, includes importing data, stupid for loops
% and your impatient ass :)
toc;
%% part2
tic;

data = importdata('day4puzzleinput.txt');
char
for i = 1:length(data)
    for p = 1:116
    prodata(i,p) = data{i}(p);  %mikey, we went indexing
        %SHIT BONO, he rammed into me
        %I need to learn how to pre allocate a char array properly, i don't
        %get it
    end
end

winning = zeros(193,10);
having = zeros(193,25);

for h = 1:length(data)
winning(h,:) = sscanf(prodata(h,11:39),'%d');
having(h,:) = sscanf(prodata(h,43:116),'%d');
end

for z = 1:length(data)  %z cause i'm sleepin
   wincountrow(z,:) = ismember(having(z,:),winning(z,:));
end

sumwincount = zeros(193,1);
for a = 1:length(data)
sumwincount(a) = sum(wincountrow(a,:));
end

sumwincountcopy = sumwincount;

originalcardcount = ones(length(data),1);
% totalcardcount = originalcardcount;
%ik begin maar lekker naief, while loopje
c=0;
for i = 1:193
   
    if ~sumwincount(i)==0
       
        while ~sumwincount(i)==0
            
            originalcardcount(i+1+c) = originalcardcount(i+1+c) + originalcardcount(i);
            c=c+1;
            sumwincount(i) = sumwincount(i)-1;
            
            
        end
        c=0;
    end
    
end

finalanswer = sum(originalcardcount);
%elapsed time is 0.008923 seconds

% Hockenheim 2010: "MATLAB is faster than you" (OG: "Fernando is faster than
% you")
toc;

% HALLO! Zit jij hier en denk je, ik wil een leuk filmpje kijken, geef mij
% leuk filmpje! Nou, nou, hier is leuk filmpje voor je: https://www.youtube.com/watch?v=iR-K2rUP86M

