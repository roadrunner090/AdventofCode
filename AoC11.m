%AoC11.m

data = fileread('day11puzzleinput.h');

datarray=char(zeros(140,140));

data = erase(data,newline); %we verwijderen hier char unicodes 10 en 13, zijn alle newlines in het .txt bestand.
data = erase(data,char(13)); %Bonus info: '.' heeft code 46 en '#' heeft code 35.

%De enige reden dat ik 'newline' typ ipv char(10) is omdat matlab anders
%een ROOD deel geeft wat stoort.

%Ik had dit ook in AoC10.m kunnen doen, toen moest ik stroef de .txt file
%aanpassen. Maar nu ben ik ouder, wijzer, slimmer enz. 
% data = strtrim(data);


for i = 1:140
    if i ==1
        datarray(i,:) = data(1:140);
    else
        
        datarray(i,:) = data((140*(i-1)+1):(140*i));
    end
end
tic;
%^^lekker alles in een array stoppen, lijkt een beetje op AoC10.m


%Strijdplan: eerst alle galaxies (#) vinden met een for loop, en dan de
%coordinaten van de galaxies vinden in die for loop en noteren. Dan, voor
%elke galaxy (nog een for loop), loopen naar alle volgende galaxies. Loop
%structuur:

% for x2
% end x2
% 
% for
%     while
%     end
% end

numgalaxies = sum(sum(datarray=='#')); 
%number galaxies tellen, ik roep hier 2x sum, want 2 dimensies. Bonus info;
%we sommen eigenlijk de eerste keer over een logical array, en de tweede
%keer over een 1x140 double. Impliciet typecasten kan dus ook in MATLAB,
%want is C-BASED.


numpairs = nchoosek(numgalaxies,2);



galcoords = zeros(435,2); %coords in x, y

%Here: expand galaxies
newrows = zeros(height(datarray),1);
newcolumns = zeros(width(datarray),1);


emptycheck = (datarray=='#');
rows = zeros(0);
i = 1;
for r = 1:140
    if sum(emptycheck(r,:))==0
        rows(i) = r;
        i=i+1;
    end
end
cols = zeros(0);
i=1;
for c = 1:140
    if sum(emptycheck(:,c))==0
        cols(i) = c;
        i=i+1;
    end
end

clear r c

%We now want to expand our galaxy. So datarray will be a new datarray,
%which will have 12 new columns and 10 new rows in our case. 
%Old dimensions were 140x140 char, now they are 150x152 char.
newdatarray = datarray; 
emptyrow = datarray(16,:);

o=0;    
%o is offset, to ensure that we grow the galaxy in the right spots, since
%indexes change value as we grow our galaxy. 
for r = 1:numel(rows)
    array1 = newdatarray(1:(rows(r)+o),:);
    array2 = newdatarray((rows(r)+o+1):end,:);
    array1n = cat(1,array1,emptyrow);
    newdatarray = cat(1,array1n,array2);
    o = o + 1;
end
o=0;
emptycol = newdatarray(:,11);
for c = 1:numel(cols)
    array1 = newdatarray(:,1:cols(c)+o);
    array2 = newdatarray(:,(cols(c)+o+1):end);
    array1n = cat(2,array1,emptycol);
    newdatarray = cat(2,array1n,array2);
    o = o + 1;
end

%PRETTY EASY so far...
%We now get coordinates of all galaxies in expanded universe. 
i = 1; %number of galaxies
for curposx = 1:width(newdatarray)
    for curposy = 1:height(newdatarray)
        if newdatarray(curposy,curposx)=='#'
            galcoords(i,1) = curposx;
            galcoords(i,2) = curposy;
            i = i+1;
        end
    end
end


%Now we can finally calculate all the path lengths of all the galaxy pairs.
%We have 435 galaxies, which leads to 94395 galaxy pairs. We do a while
%loop in a for loop, so that we do not count pairs twice. 
galpairspathlengths = zeros(numpairs,1);
p2 = 1;
i=1;
for p1 = 1:(height(galcoords)-1)
    p2 = p1+1;  %initialize p2 again. 
    while p2 < (height(galcoords)+1)
        galpairspathlengths(i) = abs(galcoords(p1,1)-galcoords(p2,1)) + abs(galcoords(p1,2)-galcoords(p2,2));
        p2 = p2+1; %go to next galaxy
        i=i+1;     %increment galpairspathlengths index
    end
    
end

answer1 = sum(galpairspathlengths);


%Part 2, making everything 1 million times larger...
%list of empty rows: [16,47,50,52,55,68,75,85,86,136]
%list of empty cols: [11,34,40,49,64,78,79,83,92,128,132,139]
% ipv alles stroef rekenen door een matrix te maken die 10 miljoen rijen
% heeft en 12 miljoen kolommen, ga ik proberen een beetje na te denken
% terwijl ik programmeer. 
% Ik kan checken of de x en y coordinaten over een 'expand' threshold 
% komen, en dan 999,999 optellen bij de berekende afstand. Dit kan dus ook
% meerdere keren voorkomen, als wij meerdere thresholds in de x of y
% richting tegenkomen.

galcoords2 = galcoords;
i = 1; %number of galaxies
for curposx = 1:width(datarray)
    for curposy = 1:height(datarray)
        if datarray(curposy,curposx)=='#'
            galcoords2(i,1) = curposx;
            galcoords2(i,2) = curposy;
            i = i+1;
        end
    end
end


galpairspathlengthsBIG = zeros(numpairs,1);
p2 = 1;
i=1;
for p1 = 1:(height(galcoords2)-1)
    p2 = p1+1;  %initialize p2 again. 
    while p2 < (height(galcoords2)+1)
        galpairspathlengthsBIG(i) = abs(galcoords2(p1,1)-galcoords2(p2,1)) + abs(galcoords2(p1,2)-galcoords2(p2,2));
        rowcheck1 = (galcoords2(p1,2)<rows(:));        %row is y
        rowcheck2 = (galcoords2(p2,2)<rows(:));        %row is y
        nrows = abs(sum(rowcheck1-rowcheck2));
        colcheck1 = (galcoords2(p1,1)<cols(:));        %col is x
        colcheck2 = (galcoords2(p2,1)<cols(:));        %col is x
        ncols = abs(sum(colcheck1-colcheck2));
        galpairspathlengthsBIG(i) = galpairspathlengthsBIG(i) + (999999)*nrows + (999999)*ncols;
        p2 = p2+1; %go to next galaxy
        i=i+1;     %increment galpairspathlengths index
    end
    
end

answer2 = sum(galpairspathlengthsBIG);