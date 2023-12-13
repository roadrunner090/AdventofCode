%AoC7.m
% Is een tijdje geleden, werk was veel tijd.

clc;

data = importdata('day7puzzleinput.txt'); 
% ^^ MATLAB had hier een struct van gemaakt waar ik wat mee kon, ongekend. 

A = pattern('A'); K = pattern('K'); Q = pattern('Q'); J = pattern('J');
T = pattern('T'); n9 = pattern('9'); n8 = pattern('8'); n7 = pattern('7');
n6 = pattern('6'); n5 = pattern('5'); n4 = pattern('4'); n3 = pattern('3');
n2 = pattern('2');

typelist = [A;K;Q;J;T;n9;n8;n7;n6;n5;n4;n3;n2];

scorerank = zeros(length(data.textdata),1);
valuematrix = zeros(length(data.textdata),5); %YOU GOTTA VALUE VALUE

%Even uitleg wat ik hier doe: Ik loop door elke hand heen, en dan check ik
%voor elk type kaart wat er in de hand zit. Ik ga dan kijken welke 'scorerank' ik
%heb. (five of a kind, four of a kind, full house, three of a kind, two
%pair, one pair, high card) 

%Daarna sla ik ook op welke waarde de 1de, 2de, 3de enz. kaarten hadden 
%voor het geval dat twee kaarten dezelfde scorerank hebben (gaat vaak gebeuren).

%Nadat ik alle informatie heb, kan ik de grote sorteer truc doen door
%sortrows.m te misbruiken. Beetje gevalletje van 2 for loops bouwen om de
%input te parsen, LMFAO. 
fullh = false;
doublepair = false;
tic;
for i = 1:length(data.textdata)     %Ik denk in for loopjes...
    
    %Ook al check je met het sorteren juist op het eind welke waarde elke kaart
    %heeft, doe ik het in het begin om de lezer te verwarren. 
    for p = 1:5
        VAL = extract(data.textdata{i},p); %verassings caps lock, geniet ervan!
        for q = 1:length(typelist)
            if contains(VAL,typelist(q))
               valuematrix(i,p) =  14 - q;
            end
        end
    end
        
            %Hey dawg, I heard you liked for loops, so I put a for loop
            %after your for loop that had a for loop inside of it, whilst I
            %am in a for loop. 
            
    for k = 1:length(typelist)
        
        
        if count(data.textdata{i},typelist(k)) == 5
        
            scorerank(i) = 7;
            break;
        end
    
        if count(data.textdata{i},typelist(k)) == 4
        
            scorerank(i) = 6;
            break;
        end
        
                    %Uh oh, nu zien we drie van 1 type hieronder. Dat betekent dat
                    %full house mogelijk zou zijn, dus dat betekent dat we
                    %ook moeten checken of er 2 van een andere type zijn.
                    %dit betekent een for loop met length k-1, sinds we
                    %niet hogere waardes meer kunnen vinden. Correctie, dit is niet waar   
                    %We gaan nu gewoon beide kanten op kijken. 
        if (count(data.textdata{i},typelist(k)) == 3) || (count(data.textdata{i},typelist(k)) == 2)
            if (count(data.textdata{i},typelist(k)) == 3)
                if ~(k == 13) %geen full house als je 3x 2 op het eind vindt.
                    for b = 1:(13-k) %wordt jij niet opgewonden van een conditionele for loop?
                        if count(data.textdata{i},typelist(k+b)) == 2   %check lower values
                            scorerank(i) = 5;
                            fullh = true;
                        end
                    end
                    if ~(k == 1)
                        for c = 1:(k-1)
                            if count(data.textdata{i},typelist(c)) == 2  %check higher values
                                scorerank(i) = 5;
                                fullh =true;
                            end
                        end
                    end
                end
                if k == 13
                    for d = 1:12
                        if count(data.textdata{i},typelist(d)) == 2 %check higher values again
                            scorerank(i) = 5;
                            fullh = true;
                        end
                    end
                end
            
            
            %write here also loop for larger values
            
            
                if ~fullh
                    scorerank(i) = 4;   %geen full house, maar wel 3 van 1 soort, 3 of a kind!
                end
            end
            
            if (count(data.textdata{i},typelist(k)) == 2)
                for f = 1:(13-k)
                    if count(data.textdata{i},typelist(k+f)) == 3   %check lower values
                            scorerank(i) = 5;
                            %fullh = true;
                    end
                end
            end
            fullh = false;  %reset fullh boolean. 
            
            if (count(data.textdata{i},typelist(k)) == 2) && (~(scorerank(i)==5))
            %we do not add break here so that we can still see if we have
            %one or two two pair. 
            else
                break;
            end
        end
        
        
        %nu nog even 2 pair en one pair berekenen. We gebruiken dezelfde
        %logica als bij full house, maar nu 2x checken of we een paar
        %hebben. Natuurlijk kijken we alleen voor waardes die we nog moeten
        %checken, dus lagere waardes. Er kan geen situatie ontstaan dat wij
        %bijv. 2x een 3 vinden, en we de 2x 9 nog niet hebben gevonden. 
        
        if count(data.textdata{i},typelist(k)) == 2  
            if ~(k == 13)
                for e = 1:(13-k)
                    if count(data.textdata{i},typelist(k+e)) == 2
                        scorerank(i) = 3;
                        doublepair = true;
                        %break;
                    end
                end
            end
            
            if ~doublepair
                scorerank(i) = 2;   %only one pair. 
                
            end
            doublepair = false; %reset doublepair boolean. 
            break;
        end
        
        %best wel sad, als wij hier komen hebben we geen if statement
        %getriggerd, dus high card. bij elke if statement hebben we ook een
        %break dus zou goed moeten komen. 
        
            scorerank(i) = 1;
    end
    %clear fullh
end

check1 = sum(scorerank==1,'all');
check2 = sum(scorerank==2,'all');
check3 = sum(scorerank==3,'all');
check4 = sum(scorerank==4,'all');
check5 = sum(scorerank==5,'all');
check6 = sum(scorerank==6,'all');
check7 = sum(scorerank==7,'all');
supermatrix = cat(2,data.data,scorerank);
supermatrix = cat(2,supermatrix,valuematrix);

supermatrix = sortrows(supermatrix, [2 3 4 5 6 7]);
rank = 1:1000;

answer = sum(supermatrix(:,1).*rank');
toc;

%leuk filmpje linkje: https://www.youtube.com/watch?v=KAWU2Vfoq8Q
%Ik ben vrij zeker dat je deze nog niet hebt gezien!

%% part 2

%HALLO BEZOEKERS! DIT IS DEEL 2!!! 
%Het was een vergissing om Alexander Keizer een MATLAB licensie te geven...







%TO DO: redo this with joker rule: J is now lowest value, but can pretend
%to be any value to increase scorerank. 
tic;
typelist = [A;K;Q;T;n9;n8;n7;n6;n5;n4;n3;n2;J]; %new typelist lmfao

scorerank = zeros(length(data.textdata),1);
valuematrix = zeros(length(data.textdata),5); %YOU GOTTA VALUE VALUE

fullh = false;
doublepair = false;

for i = 1:length(data.textdata)     %We checken niet voor J.
    
    %Ook al check je met het sorteren juist op het eind welke waarde elke kaart
    %heeft, doe ik het in het begin om de lezer te verwarren. 
    for p = 1:5
        VAL = extract(data.textdata{i},p); %verassings caps lock, geniet ervan!
        for q = 1:length(typelist)  %hier checken we wel voor J voor value. 
            if contains(VAL,typelist(q))
               valuematrix(i,p) =  14 - q;
            end
        end
    end
        
            %Hey dawg, I heard you liked for loops, so I put a for loop
            %after your for loop that had a for loop inside of it, whilst I
            %am in a for loop. 
            
    for k = 1:(length(typelist)-1)
        
        %typelist(13) is J, "there is another" as they say. 
        %WOW dit rijmt!
        
        if count(data.textdata{i},[typelist(k) typelist(13)]) == 5
        
            scorerank(i) = 7;
            break;
        end
        
    end
    
    for k = 1:(length(typelist)-1)
        if scorerank(i) == 7
           break; 
        end
        
        if count(data.textdata{i},[typelist(k) typelist(13)]) == 4
        
            scorerank(i) = 6;
            break;
        end
    end
    
    for k = 1:(length(typelist)-1)
        if scorerank(i) == 7
            break;
        end
        if scorerank(i) == 6
            break;
        end
        
                    %Uh oh, nu zien we drie van 1 type hieronder. Dat betekent dat
                    %full house mogelijk zou zijn, dus dat betekent dat we
                    %ook moeten checken of er 2 van een andere type zijn.
                    %dit betekent een for loop met length k-1, sinds we
                    %niet hogere waardes meer kunnen vinden. Correctie, dit is niet waar   
                    %We gaan nu gewoon beide kanten op kijken. 
        if (count(data.textdata{i},[typelist(k) typelist(13)]) == 3) || (count(data.textdata{i},[typelist(k) typelist(13)]) == 2)
            if (count(data.textdata{i},[typelist(k) typelist(13)]) == 3)
                if ~(k == 12) %geen full house als je 3x 2 op het eind vindt.
                    for b = 1:(12-k) %wordt jij niet opgewonden van een conditionele for loop?
                        if count(data.textdata{i},typelist(k+b)) == 2   %check lower values
                            scorerank(i) = 5;
                            fullh = true;
                        end
                    end
                    if ~(k == 1)
                        for c = 1:(k-1)
                            if count(data.textdata{i},typelist(c)) == 2  %check higher values
                                scorerank(i) = 5;
                                fullh =true;
                            end
                        end
                    end
                end
                if k == 12
                    for d = 1:11
                        if count(data.textdata{i},typelist(d)) == 2 %check higher values again
                            scorerank(i) = 5;
                            fullh = true;
                        end
                    end
                end
            
            
            %write here also loop for larger values
            
            
                if ~fullh
                    scorerank(i) = 4;   %geen full house, maar wel 3 van 1 soort, 3 of a kind!
                end
            end
            
            if (count(data.textdata{i},[typelist(k) typelist(13)]) == 2)
                for f = 1:(12-k)
                    if count(data.textdata{i},typelist(k+f)) == 3   %check lower values
                            scorerank(i) = 5;
                            %fullh = true;
                    end
                end
            end
            fullh = false;  %reset fullh boolean. 
            
            if (count(data.textdata{i},[typelist(k) typelist(13)]) == 2) && (~(scorerank(i)==5))
            %we do not add break here so that we can still see if we have
            %one or two two pair. 
            else
                break;
            end
        end
    end
    
    for k = 1:(length(typelist)-1)
        if scorerank(i) == 7
            break;
        end
        if scorerank(i) == 6
            break;
        end
        if scorerank(i) == 5 
            break;
        end
        if scorerank(i) == 4
            break;
        end
        %nu nog even 2 pair en one pair berekenen. We gebruiken dezelfde
        %logica als bij full house, maar nu 2x checken of we een paar
        %hebben. Natuurlijk kijken we alleen voor waardes die we nog moeten
        %checken, dus lagere waardes. Er kan geen situatie ontstaan dat wij
        %bijv. 2x een 3 vinden, en we de 2x 9 nog niet hebben gevonden. 
        
        if (count(data.textdata{i},[typelist(k) typelist(13)]) == 2) && (count(data.textdata{i},typelist(13)) == 1) || (count(data.textdata{i},typelist(k))==2)
            if (count(data.textdata{i},typelist(k))==2)
                for e = 1:(12-k)    %checking lower values
                    if count(data.textdata{i},[typelist(k+e) typelist(13)]) == 2
                        scorerank(i) = 3;
                        doublepair = true;
                        %break;
                    end
                end
            end
            
            if ~doublepair
                scorerank(i) = 2;   %only one pair. 
                
            end
            doublepair = false; %reset doublepair boolean. 
            break;
        end
        
        %best wel sad, als wij hier komen hebben we geen if statement
        %getriggerd, dus high card. bij elke if statement hebben we ook een
        %break dus zou goed moeten komen. 
        
            scorerank(i) = 1;
    
    end
    %clear fullh
end


check1 = sum(scorerank==1,'all');
check2 = sum(scorerank==2,'all');
check3 = sum(scorerank==3,'all');
check4 = sum(scorerank==4,'all');
check5 = sum(scorerank==5,'all');
check6 = sum(scorerank==6,'all');
check7 = sum(scorerank==7,'all');
supermatrix = cat(2,data.data,scorerank);
supermatrix = cat(2,supermatrix,valuematrix);

supermatrix = sortrows(supermatrix, [2 3 4 5 6 7]);
rank = 1:1000;

answer = sum(supermatrix(:,1).*rank');
toc;


