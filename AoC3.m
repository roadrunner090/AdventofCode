clc;
clear variables;
data = importdata('day3puzzleinput.txt');
prodata = char(length(data),length(data));
for i = 1:length(data)
    for p = 1:length(data)
    prodata(i,p) = data{i}(p);  %Mikey, we went indexing
    end
end

langepuntunit = '............................................................................................................................................';
langepuntunit = langepuntunit';
%sommige variables hebben geen uitleg nodig hoop ik

prodata = cat(2,langepuntunit,prodata);
prodata = cat(2,langepuntunit,prodata);
prodata = cat(2,prodata,langepuntunit);
prodata = cat(2,prodata,langepuntunit);

%% begin with part1

onedigit = digitsPattern(1);
twodigit = digitsPattern(2);
threedigit = digitsPattern(3);
punt = ".";     %mooie aan matlab, 'dot' is al een functie LMFAO
punt3 = "...";
punt4 = "....";
punt5 = "....."; %there must be a better way but lazy bastard

partnumbersum = 0;

for i = 1:height(prodata)          %i because i forgor
    for c = 3:(width(prodata)-2)          %c because column
        if i == 1    %exception if first or last row
             if contains(prodata(i,c),onedigit) && ~contains(prodata(i,c:(c+1)),twodigit) && ~contains(prodata(i,c:(c+2)),threedigit) && ~contains(prodata(i,(c-1):c),twodigit) && ~contains(prodata(i,(c-2):c),threedigit)
%                 locations1 = strfind(prodata(i,c),onedigit);
%                 locations2 = strfind(prodata(i,c),twodigit);
%                 locations3 = strfind(prodata(i,c),threedigit);

                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+1),punt) || ~contains(prodata(i+1,(c-1):(c+1)),punt3)
                        partnumbersum = partnumbersum + str2double(prodata(i,c));
                    end
                    
             end
                
             if contains(prodata(i,c:(c+1)),twodigit) && ~contains(prodata(i,c:(c+2)),threedigit) && ~contains(prodata(i,(c-1):(c+1)),threedigit)
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+2),punt) || ~contains(prodata(i+1,(c-1):(c+2)),punt4)
                        partnumbersum = partnumbersum + str2double(prodata(i,c:c+1));
                    end                 
             end
            
             if contains(prodata(i,c:(c+2)),threedigit) 
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+3),punt) || ~contains(prodata(i+1,(c-1):(c+3)),punt5)
                        partnumbersum = partnumbersum + str2double(prodata(i,c:c+2));
                    end
             end
            
            
         elseif i == height(prodata)%LAST ROW
             if contains(prodata(i,c),onedigit) && ~contains(prodata(i,c:(c+1)),twodigit) && ~contains(prodata(i,c:(c+2)),threedigit) && ~contains(prodata(i,(c-1):c),twodigit) && ~contains(prodata(i,(c-2):c),threedigit)
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+1),punt) || ~contains(prodata(i-1,(c-1):(c+1)),punt3)
                        partnumbersum = partnumbersum + str2double(prodata(i,c));
                    end
             end
             if contains(prodata(i,c:(c+1)),twodigit) && ~contains(prodata(i,c:(c+2)),threedigit) && ~contains(prodata(i,(c-1):(c+1)),threedigit)
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+2),punt) || ~contains(prodata(i-1,(c-1):(c+2)),punt4)
                        partnumbersum = partnumbersum + str2double(prodata(i,c:c+1));
                    end
             end
             if contains(prodata(i,c:(c+2)),threedigit)
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+3),punt) || ~contains(prodata(i-1,(c-1):(c+3)),punt5)
                        partnumbersum = partnumbersum + str2double(prodata(i,c:c+2));
                    end
             end
             
                 
                 
        else %ALL OTHER ROWS
            
             if contains(prodata(i,c),onedigit) && ~contains(prodata(i,c:(c+1)),twodigit) && ~contains(prodata(i,c:(c+2)),threedigit) && ~contains(prodata(i,(c-1):c),twodigit) && ~contains(prodata(i,(c-2):c),threedigit)
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+1),punt) || ~contains(prodata(i-1,(c-1):(c+1)),punt3) || ~contains(prodata(i+1,(c-1):(c+1)),punt3)
                        partnumbersum = partnumbersum + str2double(prodata(i,c));
                    end
             end
             if contains(prodata(i,c:(c+1)),twodigit) && ~contains(prodata(i,c:(c+2)),threedigit) && ~contains(prodata(i,(c-1):(c+1)),threedigit)
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+2),punt) || ~contains(prodata(i-1,(c-1):(c+2)),punt4) || ~contains(prodata(i+1,(c-1):(c+2)),punt4)
                        partnumbersum = partnumbersum + str2double(prodata(i,c:c+1));
                    end
             end
             if contains(prodata(i,c:(c+2)),threedigit)
                    if ~contains(prodata(i,c-1),punt) || ~contains(prodata(i,c+3),punt) || ~contains(prodata(i-1,(c-1):(c+3)),punt5) || ~contains(prodata(i+1,(c-1):(c+3)),punt5)
                        partnumbersum = partnumbersum + str2double(prodata(i,c:c+2));
                    end
             end            
        end
    end
end

%you dizzy yet?

%% part 2

%initialization again:

clc;
clear variables;
tic;
data = importdata('day3puzzleinput.txt');
prodata = char(length(data),length(data));

for i = 1:length(data)
    for p = 1:length(data)
    prodata(i,p) = data{i}(p);  %Mikey, we went indexing
    end
end
toc;
langepuntunit = '............................................................................................................................................';
langepuntunit = langepuntunit';
%sommige variables hebben geen uitleg nodig hoop ik

prodata = cat(2,langepuntunit,prodata);
prodata = cat(2,langepuntunit,prodata);
prodata = cat(2,prodata,langepuntunit);
prodata = cat(2,prodata,langepuntunit);
% Voor als je jezelf echt haat maar op een of andere manier komt dopamine vrij
% hiermee...
onedigit = digitsPattern(1);
twodigit = digitsPattern(2);
threedigit = digitsPattern(3);
punt = ".";     %mooie aan matlab, 'dot' is al een functie LMFAO
punt2 = "..";
punt3 = "...";
punt4 = "....";
punt5 = "....."; %there must be a better way but lazy bastard
star = "*"; %Good meme about star: https://www.youtube.com/watch?v=PaZXPx1kdtg
doublepat = digitsPattern(1) + "." + digitsPattern(1);
% we loop in height and width, and plug and pray so to speak (133 64)
digitcount = 0;
gearratio = 0;
starcount = 0;
gearlist = zeros(1,354);
gearnumber = 0;

% gearratio = gearfunction(prodata);
numgears = sum(sum((prodata=='*')));
gearcoords = zeros(numgears,2);
i=1;
for y = 1:140
    for x = 1:144
        if prodata(y,x)=='*'
            gearcoords(i,1) = x;
            gearcoords(i,2) = y;
            i=i+1;
        end
    end
end

gearratios = zeros(numgears,1);

%charcodes to remove: 46, 38, 43, 61, 45  47 36 64 37
%                      .  &   +    =   -  /  $  @  %
% ordered: 36, 37, 38, 43, 45, 46, 47, 61, 64.
curcoords = zeros(1,2); %x, y

%based on adjacency, we can multiply the right numbers
northwest = false;
north = false;
northeast = false;
east = false;
southeast = false;
south = false;
southwest = false;
west = false; 

for g = 1:numgears
    x = gearcoords(g,1);
    y = gearcoords(g,2);
    
    if contains(prodata(y-1,x-1),onedigit)
        northwest = true;
    end
    if contains(prodata(y-1,x),onedigit)
        north=true;
    end
    if contains(prodata(y-1,x+1),onedigit)
        northeast = true;
    end
    if contains(prodata(y,x+1),onedigit)
        east = true;
    end
    if contains(prodata(y+1,x+1),onedigit)
        southeast = true;
    end
    if contains(prodata(y+1,x),onedigit)
        south = true;
    end
    if contains(prodata(y+1,x-1),onedigit)
        southwest = true;
    end
    if contains(prodata(y,x-1),onedigit)
        west = true;
    end
    
    if (northwest+north+northeast+east+southeast+south+southwest+west) < 2 %it wasn't a gear :(
        gearratios(g) = 0; %Where were you when it was not a gear? %I was in for loop eating dorito, when phone ring: "gear is kill" "no"
        continue
    end
    
    if east && west
        number1 = regexp(prodata(y,(x-1):(x-3)),'[0-9]','match');
        number2 = regexp(prodata(y,(x+1):(x+3)),'[0-9]','match');
        number1 = str2double(cell2mat(number1));
        number2 = str2double(cell2mat(number2));
        gearratios(g) = number1*number2;
        continue
    end
    
    if northwest && northeast && ~north
        
        
    end
    
    if southwest && southeast && ~south
        
        
    end
    
    
    
    
end

%                         numberabove = regexp(prodata(i-1,(c-2):(c)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));    


% 
% 
% for i = 2:height(prodata)-1
% % for i = 2:12
%     for c = 3:width(prodata)-2
% %     for c = 66
%         if contains(prodata(i,c),star)  %FERRARI: we are checking
%             starcount = starcount + 1;
%             if (contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c:(c+1)),onedigit)) || (contains(prodata(i-1,c+1),onedigit) && ~contains(prodata(i-1,(c-1):c),onedigit)) || (contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+1),onedigit)) || (contains(prodata(i-1,(c-1):c),twodigit) && ~contains(prodata(i-1,c+1),onedigit)) || (contains(prodata(i-1,c:(c+1)),twodigit) && ~contains(prodata(i-1,c-1),onedigit)) || contains(prodata(i-1,(c-1):(c+1)),threedigit)
%                 digitcount = digitcount + 1;
%                 above = true; %These booleans will help us later, trust me
%             end
%             
%             if contains(prodata(i,(c-1)),onedigit)
%                 digitcount = digitcount + 1;
%                 left = true;
%             end
%             
%             if contains(prodata(i,(c+1)),onedigit)
%                 digitcount = digitcount + 1;
%                 right = true;
%             end
%             
%             if (contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c:(c+1)),onedigit)) || (contains(prodata(i+1,c+1),onedigit) && ~contains(prodata(i+1,(c-1):c),onedigit)) || (contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+1),onedigit)) || (contains(prodata(i+1,(c-1):c),twodigit) && ~contains(prodata(i+1,c+1),onedigit)) || (contains(prodata(i+1,c:(c+1)),twodigit) && ~contains(prodata(i+1,c-1),onedigit)) || contains(prodata(i+1,(c-1):(c+1)),threedigit)
%                 digitcount = digitcount + 1;
%                 below = true;
%             end
%             
%             if contains(prodata(i-1,(c-1)),onedigit) && contains(prodata(i-1,(c+1)),onedigit) && ~contains(prodata(i-1,c),onedigit)
%                 digitcount = 2;
%                 doubleabove = true;
%                
%             end
%             
%             if contains(prodata(i+1,(c-1)),onedigit) && contains(prodata(i+1,(c+1)),onedigit) && ~contains(prodata(i+1,c),onedigit)
%                 digitcount = 2;
%                 doublebelow = true;
%             end
%             
%             
%             if ~exist('left','var')
%                 left = false;
%             end
%             if ~exist('right','var')
%                 right = false;
%             end
%             if ~exist('above','var')
%                 above = false;
%             end
%             if ~exist('below','var')
%                 below = false;
%             end
%             
%             if ~exist('doublebelow','var')
%                 doublebelow = false;
%             end
%             
%             if ~exist('doubleabove','var')
%                 doubleabove = false;
%             end
%          
%             
%             if digitcount == 2   %iff this is true, then we have found a gear
%                 gearnumber = gearnumber+1;
%                 %six options ladies and gentlemen
%                 %1 left and right. 2 left and above. 3 left and below.
%                 %4 right and above. 5 right and below. 6 above and below
%                 
%                 if left && right 
%                    numberleft = regexp(prodata(i,(c-2):c),'[0-9]','match');
%                    numberleft = str2double(cell2mat(numberleft));
%                    numberright = regexp(prodata(i,c:(c+2)),'[0-9]','match');
%                    numberright = str2double(cell2mat(numberright));
%                    
%                    gearstore = numberleft*numberright;
%                    gearratio = gearratio + numberleft*numberright;
%                    
%                 elseif left && above
%                    numberleft = regexp(prodata(i,(c-2):c),'[0-9]','match');
%                    numberleft = str2double(cell2mat(numberleft));
%                    
%                    %begin 'abovecode'
%                  
%                    if contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-3):(c-1)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-3):(c-1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-2):(c-1)),twodigit) && ~contains(prodata(i-1,(c-3)),onedigit) && ~contains(prodata(i-1,c),onedigit)
%                         numberabove = regexp(prodata(i-1,(c-2):(c-1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-2),onedigit)
%                         numberabove = regexp(prodata(i-1,c-1),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end
%                    
%                    
%                    if contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-2):(c)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-2):(c)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-1):c),twodigit) && ~contains(prodata(i-1,c-2),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
%                         numberabove = regexp(prodata(i-1,(c-1):c),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,c:(c+1)),twodigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
%                         numberabove = regexp(prodata(i-1,c:(c+1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
%                         numberabove = regexp(prodata(i-1,c),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end
%                    
%                    if contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c-1):(c+1)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-1):(c+1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,c:(c+2)),threedigit)
%                         numberabove = regexp(prodata(i-1,c:(c+2)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+3)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c+1):(c+3)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+2)),twodigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+3),onedigit)
%                         numberabove = regexp(prodata(i-1,(c+1):(c+2)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
%                         numberabove = regexp(prodata(i-1,c+1),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end                   
%                    
%                    %end 'abovecode'
%                    gearstore = numberleft*numberabove;
%                    gearratio = gearratio + numberleft*numberabove;
%                    
%                 elseif left && below
%                     numberleft = regexp(prodata(i,(c-2):c),'[0-9]','match');
%                     numberleft = str2double(cell2mat(numberleft));
%                    
%                     %begin 'belowcode' WIP change this to check below!
%                    if contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-3):(c-1)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-3):(c-1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-2):(c-1)),twodigit) && ~contains(prodata(i+1,(c-3)),onedigit) && ~contains(prodata(i+1,c),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c-2):(c-1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c-1),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end
%                    
%                    
%                    if contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-2):(c)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-2):(c)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-1):c),twodigit) && ~contains(prodata(i+1,c-2),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c-1):c),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,c:(c+1)),twodigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c:(c+1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
%                         numberbelow = regexp(prodata(i+1,c),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end
%                    
%                    if contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c-1):(c+1)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-1):(c+1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,c:(c+2)),threedigit)
%                         numberbelow = regexp(prodata(i+1,c:(c+2)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+3)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c+1):(c+3)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+2)),twodigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+3),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c+1):(c+2)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c+1),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end       
%                       
%                     %end 'belowcode' WIP
%                     gearstore = numberleft*numberbelow;
%                     gearratio = gearratio + numberleft*numberbelow;
%                     
%                 elseif right && above
%                     
%                    numberright = regexp(prodata(i,c:(c+2)),'[0-9]','match');
%                    numberright = str2double(cell2mat(numberright));
%                    
%                    %begin 'abovecode'
%                    if contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-3):(c-1)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-3):(c-1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-2):(c-1)),twodigit) && ~contains(prodata(i-1,(c-3)),onedigit) && ~contains(prodata(i-1,c),onedigit)
%                         numberabove = regexp(prodata(i-1,(c-2):(c-1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-2),onedigit)
%                         numberabove = regexp(prodata(i-1,c-1),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end
%                    
%                    
%                    if contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-2):(c)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-2):(c)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-1):c),twodigit) && ~contains(prodata(i-1,c-2),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
%                         numberabove = regexp(prodata(i-1,(c-1):c),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,c:(c+1)),twodigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
%                         numberabove = regexp(prodata(i-1,c:(c+1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
%                         numberabove = regexp(prodata(i-1,c),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end
%                    
%                    if contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c-1):(c+1)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-1):(c+1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,c:(c+2)),threedigit)
%                         numberabove = regexp(prodata(i-1,c:(c+2)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+3)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c+1):(c+3)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+2)),twodigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+3),onedigit)
%                         numberabove = regexp(prodata(i-1,(c+1):(c+2)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
%                         numberabove = regexp(prodata(i-1,c+1),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end
%                    
%                    %end 'abovecode'
%                     gearstore = numberright*numberabove;
%                     gearratio = gearratio + numberright*numberabove;
%                     
%                 elseif right && below
%                    numberright = regexp(prodata(i,c:(c+2)),'[0-9]','match');
%                    numberright = str2double(cell2mat(numberright)); 
%                    
%                    %begin 'belowcode'
%                    if contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-3):(c-1)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-3):(c-1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-2):(c-1)),twodigit) && ~contains(prodata(i+1,(c-3)),onedigit) && ~contains(prodata(i+1,c),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c-2):(c-1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c-1),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end
%                    
%                    
%                    if contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-2):(c)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-2):(c)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-1):c),twodigit) && ~contains(prodata(i+1,c-2),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c-1):c),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,c:(c+1)),twodigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c:(c+1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
%                         numberbelow = regexp(prodata(i+1,c),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end
%                    
%                    if contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c-1):(c+1)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-1):(c+1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,c:(c+2)),threedigit)
%                         numberbelow = regexp(prodata(i+1,c:(c+2)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+3)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c+1):(c+3)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+2)),twodigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+3),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c+1):(c+2)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c+1),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end       
%                      %end 'belowcode'
%                    gearstore = numberbelow*numberright;
%                    gearratio = gearratio + numberbelow*numberright;
%                    
%                    
%                 elseif above && below
%                     
%                     %begin above code:
%                    if contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-3):(c-1)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-3):(c-1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-2):(c-1)),twodigit) && ~contains(prodata(i-1,(c-3)),onedigit) && ~contains(prodata(i-1,c),onedigit)
%                         numberabove = regexp(prodata(i-1,(c-2):(c-1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-2),onedigit)
%                         numberabove = regexp(prodata(i-1,c-1),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end
%                    
%                    
%                    if contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-2):(c)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-2):(c)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-1):c),twodigit) && ~contains(prodata(i-1,c-2),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
%                         numberabove = regexp(prodata(i-1,(c-1):c),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,c:(c+1)),twodigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
%                         numberabove = regexp(prodata(i-1,c:(c+1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
%                         numberabove = regexp(prodata(i-1,c),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end
%                    
%                    if contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c-1):(c+1)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c-1):(c+1)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,c:(c+2)),threedigit)
%                         numberabove = regexp(prodata(i-1,c:(c+2)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+3)),threedigit)
%                         numberabove = regexp(prodata(i-1,(c+1):(c+3)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+2)),twodigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+3),onedigit)
%                         numberabove = regexp(prodata(i-1,(c+1):(c+2)),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    elseif contains(prodata(i-1,c+1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
%                         numberabove = regexp(prodata(i-1,c+1),'[0-9]','match');
%                         numberabove = str2double(cell2mat(numberabove));
%                    end                    
%                     
%                    if contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-3):(c-1)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-3):(c-1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-2):(c-1)),twodigit) && ~contains(prodata(i+1,(c-3)),onedigit) && ~contains(prodata(i+1,c),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c-2):(c-1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c-1),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end
%                    
%                    
%                    if contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-2):(c)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-2):(c)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-1):c),twodigit) && ~contains(prodata(i+1,c-2),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c-1):c),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,c:(c+1)),twodigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c:(c+1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
%                         numberbelow = regexp(prodata(i+1,c),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end
%                    
%                    if contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c-1):(c+1)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c-1):(c+1)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,c:(c+2)),threedigit)
%                         numberbelow = regexp(prodata(i+1,c:(c+2)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+3)),threedigit)
%                         numberbelow = regexp(prodata(i+1,(c+1):(c+3)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+2)),twodigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+3),onedigit)
%                         numberbelow = regexp(prodata(i+1,(c+1):(c+2)),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    elseif contains(prodata(i+1,c+1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
%                         numberbelow = regexp(prodata(i+1,c+1),'[0-9]','match');
%                         numberbelow = str2double(cell2mat(numberbelow));
%                    end       
%                      
%                    %end 'belowcode'
%                    
%                    gearstore = numberabove*numberbelow;
%                    gearratio = gearratio + numberabove*numberbelow;
%                    
%                 elseif doublebelow
%                     
%                     numberbelow1 = regexp(prodata(i+1,(c-3):(c-1)),'[0-9]','match');
%                     numberbelow1 = str2double(cell2mat(numberbelow1));
%                     
%                     numberbelow2 = regexp(prodata(i+1,(c+1):(c+3)),'[0-9]','match');
%                     numberbelow2 = str2double(cell2mat(numberbelow2));
%                     
%                     gearstore = numberbelow1.*numberbelow2;
%                     gearratio = gearratio + numberbelow1.*numberbelow2;
%                     
%                 elseif doubleabove
%                     numberabove1 = regexp(prodata(i-1,(c-3):(c-1)),'[0-9]','match');
%                     numberabove1 = str2double(cell2mat(numberabove1));
%                     
%                     numberabove2 = regexp(prodata(i-1,(c+1):(c+3)),'[0-9]','match');
%                     numberabove2 = str2double(cell2mat(numberabove2));
%                     
%                     gearstore = numberabove1.*numberabove2;
%                     gearratio = gearratio + numberabove1.*numberabove2;
%                     
%                 end
%                 
%                    gearlist(starcount) = gearstore;
%             end
%             digitcount=0;
%         end
%         clear above below left right gearstore doublebelow doubleabove
%         clear numberabove numberbelow numberleft numberright numberbelow1 numberbelow2 numberabove1 numberabove2
%     end
% end
% toc;





