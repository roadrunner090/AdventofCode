%data = fopen('day1puzzleinput.txt');
test = table2array(day1puzzleinput);
p=1;
output = zeros(1,length(test));
for i = 1:length(test)
    if contains(test(i),'1') || contains(test(i), 'one')
        locations1 = strfind(test(i),'1');
        locations1w = strfind(test(i),'one');
        if ~isempty(locations1w) && ~isempty(locations1)
        locations1w = cat(2,locations1w',ones(length(locations1w),1));
        locations1 = cat(2,locations1',ones(length(locations1),1));
        locations1 = cat(1,locations1,locations1w);
        locations = locations1;
        else
            if isempty(locations1w)
                locations1 = cat(2,locations1',ones(length(locations1),1));
                locations = locations1;
            else 
                locations1w = cat(2,locations1w',ones(length(locations1w),1));
                locations = locations1w;
            end
        end
    end
    if contains(test(i),'2') || contains(test(i), 'two')
        locations2 = strfind(test(i),'2');
        locations2w = strfind(test(i),'two');
        if ~isempty(locations2w) && ~isempty(locations2)
            locations2 = cat(2,locations2',2*ones(length(locations2),1));
            locations2w = cat(2,locations2w',2*ones(length(locations2w),1));
            locations2 = cat(1,locations2,locations2w);
        elseif ~isempty(locations2w)
            locations2w = cat(2,locations2w',2*ones(length(locations2w),1));
            locations2 = locations2w;
        else
            locations2 = cat(2,locations2',2*ones(length(locations2),1));
        end
        if ~exist('locations')
            locations = locations2;
        else
            locations = cat(1,locations,locations2);
        end
    end
    if contains(test(i),'3') || contains(test(i), 'three')
        locations3 = strfind(test(i),'3');
        locations3w = strfind(test(i),'three');
        if ~isempty(locations3w) && ~isempty(locations3)
            locations3 = cat(2,locations3',3*ones(length(locations3),1)); 
            locations3w = cat(2,locations3w',3*ones(length(locations3w),1));
            locations3 = cat(1,locations3,locations3w);
            
        elseif ~isempty(locations3w)
            locations3w = cat(2,locations3w',3*ones(length(locations3w),1));
            locations3 = locations3w;
        else
            locations3 = cat(2,locations3',3*ones(length(locations3),1)); 
        end
        if ~exist('locations')
            locations = locations3;
        else
            locations = cat(1,locations,locations3);
        end
    end
    if contains(test(i),'4') || contains(test(i), 'four')
        locations4 = strfind(test(i),'4');
        locations4w = strfind(test(i),'four');
        if ~isempty(locations4w) && ~isempty(locations4)
            locations4 = cat(2,locations4',4*ones(length(locations4),1));
            locations4w = cat(2,locations4w',4*ones(length(locations4w),1));
            locations4 = cat(1,locations4,locations4w);
        elseif ~isempty(locations4w)
            locations4w = cat(2,locations4w',4*ones(length(locations4w),1));
            locations4 = locations4w;
        else 
            locations4 = cat(2,locations4',4*ones(length(locations4),1));
        end
        if ~exist('locations')
            locations = locations4;
        else
            locations = cat(1,locations,locations4);
        end
    end
    if contains(test(i),'5') || contains(test(i), 'five')
        locations5 = strfind(test(i),'5');
        locations5w = strfind(test(i),'five');
        if ~isempty(locations5w) && ~isempty(locations5)
            locations5 = cat(2,locations5',5*ones(length(locations5),1));
            locations5w = cat(2,locations5w',5*ones(length(locations5w),1));
            locations5 = cat(1,locations5,locations5w);
        elseif ~isempty(locations5w)
            locations5w = cat(2,locations5w',5*ones(length(locations5w),1));
            locations5 = locations5w;
        else 
            locations5 = cat(2,locations5',5*ones(length(locations5),1));
        end
        if ~exist('locations')
            locations = locations5;
        else
            locations = cat(1,locations,locations5);
        end
    end
    if contains(test(i),'6') || contains(test(i), 'six')
        locations6 = strfind(test(i),'6');
        locations6w = strfind(test(i),'six');
        if ~isempty(locations6w) && ~isempty(locations6)
            locations6 = cat(2,locations6',6*ones(length(locations6),1));
            locations6w = cat(2,locations6w',6*ones(length(locations6w),1));
            locations6 = cat(1,locations6,locations6w);
        elseif ~isempty(locations6w)
            locations6w = cat(2,locations6w',6*ones(length(locations6w),1));
            locations6 = locations6w;
        else 
            locations6 = cat(2,locations6',6*ones(length(locations6),1));
        end
        if ~exist('locations')
            locations = locations6;
        else
            locations = cat(1,locations,locations6);
        end
    end
    if contains(test(i),'7') || contains(test(i), 'seven')
        locations7 = strfind(test(i),'7');
        locations7w = strfind(test(i),'seven');
        if ~isempty(locations7w) && ~isempty(locations7)
            locations7 = cat(2,locations7',7*ones(length(locations7),1));
            locations7w = cat(2,locations7w',7*ones(length(locations7w),1));
            locations7 = cat(1,locations7,locations7w);
        elseif ~isempty(locations7w)
            locations7w = cat(2,locations7w',7*ones(length(locations7w),1));
            locations7 = locations7w;
        else 
            locations7 = cat(2,locations7',7*ones(length(locations7),1));
        end
        if ~exist('locations')
            locations = locations7;
        else
            locations = cat(1,locations,locations7);
        end
    end
    if contains(test(i),'8') || contains(test(i), 'eight')
        locations8 = strfind(test(i),'8');
        locations8w = strfind(test(i),'eight');
        if ~isempty(locations8w) && ~isempty(locations8)
            locations8 = cat(2,locations8',8*ones(length(locations8),1));
            locations8w = cat(2,locations8w',8*ones(length(locations8w),1));
            locations8 = cat(1,locations8,locations8w);
        elseif ~isempty(locations8w)
            locations8w = cat(2,locations8w',8*ones(length(locations8w),1));
            locations8 = locations8w;
        else
            locations8 = cat(2,locations8',8*ones(length(locations8),1));
        end
        if ~exist('locations')
            locations = locations8;
        else
            locations = cat(1,locations,locations8);
        end
    end
    if contains(test(i),'9') || contains(test(i), 'nine')
        locations9 = strfind(test(i),'9');
        locations9w = strfind(test(i),'nine');
        if ~isempty(locations9w) && ~isempty(locations9)
            locations9 = cat(2,locations9',9*ones(length(locations9),1));
            locations9w = cat(2,locations9w',9*ones(length(locations9w),1));
            locations9 = cat(1,locations9,locations9w);
        elseif ~isempty(locations9w)
            locations9w = cat(2,locations9w',9*ones(length(locations9w),1));
            locations9 = locations9w;
        else
            locations9 = cat(2,locations9',9*ones(length(locations9),1));
        end
        if ~exist('locations')
            locations = locations9;
        else
            locations = cat(1,locations,locations9);
        end
    end
    
    list = locations;
%     list = cat(1,locations1,locations2,locations3,locations4,locations5,locations6,locations7,locations8,locations9);
    sortedlist = sortrows(list);
    
    if length(sortedlist) == 1
        output(i) = sortedlist(2)*11;
    else
        inbetweenstring = strcat(num2str(sortedlist(1,2)),num2str(sortedlist(end,2)));
        output(i) = str2num(inbetweenstring);
    end
        clear locations locations1 locations1w locations2 locations2w 
        clear locations3 locations3w locations4 locations4w locations5 locations5w 
        clear locations6 locations6w locations7 locations7w locations8 locations8w 
        clear locations9 locations9w
end

answer = sum(output);

