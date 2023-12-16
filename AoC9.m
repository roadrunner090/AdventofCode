%AoC9.m

data = importdata('day9puzzleinput.txt');
tic;
extraP = zeros(height(data),1);

endvalues = zeros(width(data),1);
k=1;
for i = 1:height(data)
    test = diff(data(i,:));     %best chill dat MATLAB hier difference equation support heeft
    %'any' checkt of een array nonzero waardes heeft, en geeft logical true
    %als er nonzero waardes zijn. Heel chill om als while loop conditie te
    %gebruiken.
    while any(test)             
        k=k+1;
        endvalues(k) = test(end);
        test = diff(test(:));
    end
    extraP(i) = sum(endvalues);
    k=1;
    endvalues = zeros(width(data),1);
end

answer = sum(data(:,end)+extraP);

toc;


%% part 2
tic;
extraPb = zeros(height(data),1); %backwards

flipdata = flip(data,2); %we be flippin' 
endvaluesb = zeros(width(data),1);
firstvalues = zeros(height(data),1);
k=1;
for i = 1:height(data)
    test = diff(data(i,:));     %best chill dat MATLAB hier difference equation support heeft
    %'any' checkt of een array nonzero waardes heeft, en geeft logical true
    %als er nonzero waardes zijn. Heel chill om als while loop conditie te
    %gebruiken.
    while any(test)             
        k=k+1;
        endvaluesb(k) = test(1);
        test = diff(test(:));
    end
    
    for p = k:-1:1
        if p==1
            firstvalues(i) = data(i,1)-extraPb(2);
        else
            if p==k
                extraPb(p) = endvaluesb(p);
            else
                extraPb(p) = endvaluesb(p)-extraPb(p+1); %(p+1) is eigenlijk de vorige waarde, "It's all downhill from here"
            end
        end
    end
    
    
    k=1;
    endvaluesb = zeros(width(data),1);
    %clear extraPb 
end


answer2 = sum(firstvalues);
 
toc;