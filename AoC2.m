clc;

data = importdata('day2puzzleinput.txt');

patblue = digitsPattern(2) + caseSensitivePattern(" blue");
patblue1 = digitsPattern(1) + caseSensitivePattern(" blue");
bluecheck = caseSensitivePattern("2") + digitsPattern(1) + caseSensitivePattern(" blue");
patred = digitsPattern(2) + caseSensitivePattern(" red");
patred1 = digitsPattern(1) + caseSensitivePattern(" red");
redcheck = caseSensitivePattern("2") + digitsPattern(1) + caseSensitivePattern(" red");
patgreen = digitsPattern(2) + caseSensitivePattern(" green");
greencheck = caseSensitivePattern("2") + digitsPattern(1) + caseSensitivePattern(" green");
gameIDsum = 0;
gameIDsum2 = 0;
possiblearray = zeros(1,100);
%% part 1
for i = 1:100
    if contains(data(i),patblue)
        if contains(data(i), '15 blue') || contains(data(i), '16 blue') || contains(data(i), '17 blue') || contains(data(i), '18 blue') || contains(data(i), '19 blue') || contains(data(i), bluecheck)
            gameIDsum = gameIDsum + i;
            continue
        end
    end
    
    if contains(data(i),patred)
        if contains(data(i), '13 red') || contains(data(i), '14 red') || contains(data(i), '15 red') || contains(data(i), '16 red') || contains(data(i), '17 red') || contains(data(i), '18 red') || contains(data(i), '19 red') || contains(data(i), redcheck)
            gameIDsum = gameIDsum + i;
            continue
        end
    end
    
    if contains(data(i),patgreen)
        if contains(data(i), '14 green') || contains(data(i), '15 green') || contains(data(i), '16 green') || contains(data(i), '17 green') || contains(data(i), '18 green') || contains(data(i), '19 green') || contains(data(i), greencheck)
            gameIDsum = gameIDsum + i;
            continue
        end
    end
%     gameIDsum2 = gameIDsum2 + i;
end

totalsum = sum(1:100);
possiblegames = totalsum - gameIDsum;

%% part2

patblue = digitsPattern(2) + caseSensitivePattern(" blue");
patblue1 = digitsPattern(1) + caseSensitivePattern(" blue");
patred = digitsPattern(2) + caseSensitivePattern(" red");
patred1 = digitsPattern(1) + caseSensitivePattern(" red");
patgreen = digitsPattern(2) + caseSensitivePattern(" green");
patgreen1 = digitsPattern(1) + caseSensitivePattern(" green");



% bluecheck = caseSensitivePattern("2") + digitsPattern(1) + caseSensitivePattern(" blue");
% redcheck = caseSensitivePattern("2") + digitsPattern(1) + caseSensitivePattern(" red");
% greencheck = caseSensitivePattern("2") + digitsPattern(1) + caseSensitivePattern(" green");

gameIDsum = 0;
gameIDsum2 = 0;
possiblearray = zeros(1,100);

maxvalues = zeros(100,3);
bluestringmax = zeros(100,1);
redstringmax = zeros(100,1);
greenstringmax = zeros(100,1);
for i = 1:100
   %blue
    if contains(data(i),patblue) || contains(data(i),patblue1)
        if contains(data(i),patblue1)
            blue1locations = strfind(data(i),patblue1);
            blue1locations = blue1locations{1};
            string = zeros(1,length(blue1locations));
            for k = 1:length(blue1locations)
            prodata = data{i};
            string(k) = str2double(prodata(blue1locations(k)));
            end
            clear k 
        end
        
        
        if contains(data(i),patblue)
            blue2locations = strfind(data(i),patblue);
            blue2locations = blue2locations{1};
            string2 = zeros(1,length(blue2locations));
            for k = 1:length(blue2locations)
            prodata = data{i};
            firststring(k) = prodata(blue2locations(k));
            secondstring(k) = prodata(blue2locations(k)+1);
            
            string2(k) = str2double(append(firststring(k),secondstring(k)));
            end
            clear k
        end
        
        if exist('string2')
            bluestring = cat(1,string',string2');
        else
            bluestring = string;
        end
            bluestringmax(i) = max(bluestring);
    end

    clear string string2 firststring secondstring bluestring
    
    %red
    if contains(data(i),patred) || contains(data(i),patred1)
        if contains(data(i),patred1)
            red1locations = strfind(data(i),patred1);
            red1locations = red1locations{1};
            string = zeros(1,length(red1locations));
            for k = 1:length(red1locations)
            prodata = data{i};
            string(k) = str2double(prodata(red1locations(k)));
            end
            clear k 
        end
        
        
        if contains(data(i),patred)
            red2locations = strfind(data(i),patred);
            red2locations = red2locations{1};
            string2 = zeros(1,length(red2locations));
            for k = 1:length(red2locations)
            prodata = data{i};
            firststring(k) = prodata(red2locations(k));
            secondstring(k) = prodata(red2locations(k)+1);
            
            string2(k) = str2double(append(firststring(k),secondstring(k)));
            end
            clear k
        end
        
        if exist('string2')
            redstring = cat(1,string',string2');
        else
            redstring = string;
        end
            redstringmax(i) = max(redstring);
    end    
    
        clear string string2 firststring secondstring redstring

    %green
    
    if contains(data(i),patgreen) || contains(data(i),patgreen1)
        if contains(data(i),patgreen1)
            green1locations = strfind(data(i),patgreen1);
            green1locations = green1locations{1};
            string = zeros(1,length(green1locations));
            for k = 1:length(green1locations)
            prodata = data{i};
            string(k) = str2double(prodata(green1locations(k)));
            end
            clear k 
        end
        
        
        if contains(data(i),patgreen)
            green2locations = strfind(data(i),patgreen);
            green2locations = green2locations{1};
            string2 = zeros(1,length(green2locations));
            for k = 1:length(green2locations)
            prodata = data{i};
            firststring(k) = prodata(green2locations(k));
            secondstring(k) = prodata(green2locations(k)+1);
            
            string2(k) = str2double(append(firststring(k),secondstring(k)));
            end
            clear k
        end
        
        if exist('string2')
            greenstring = cat(1,string',string2');
        else
            greenstring = string;
        end
            greenstringmax(i) = max(greenstring);
    end
    
        clear string string2 firststring secondstring greenstring

    
end


maxvalues(1:end,1) = redstringmax;
maxvalues(1:end,2) = greenstringmax;
maxvalues(1:end,3) = bluestringmax;

multipliedvalues = maxvalues(:,1).*maxvalues(:,2).*maxvalues(:,3);
answer = sum(multipliedvalues);