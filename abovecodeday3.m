%abovecode.m

if contains(prodata(i-1,c-1),onedigit)
    numberabove = regexp(prodata(i-1,(c-3):(c-1)),'[0-9]','match');
    numberabove = str2double(cell2mat(numberabove));
elseif contains(prodata(i-1,c),onedigit)
    numberabove = regexp(prodata(i-1,(c-1):(c+1)),'[0-9]','match');
    numberabove = str2double(cell2mat(numberabove));
elseif contains(prodata(i-1,c+1),onedigit)
    numberabove = regexp(prodata(i-1,(c+1):(c+3)),'[0-9]','match');
    numberabove = str2double(cell2mat(numberabove));
end 
  
    
    
    %old abovecode:
    
                   if contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-3):(c-1)),threedigit)
                        numberabove = regexp(prodata(i-1,(c-3):(c-1)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c-1),onedigit) && contains(prodata(i-1,(c-2):(c-1)),twodigit) && ~contains(prodata(i-1,(c-3)),onedigit) && ~contains(prodata(i-1,c),onedigit)
                        numberabove = regexp(prodata(i-1,(c-2):(c-1)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-2),onedigit)
                        numberabove = regexp(prodata(i-1,c-1),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   end
                   
                   
                   if contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-2):(c)),threedigit)
                        numberabove = regexp(prodata(i-1,(c-2):(c)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,(c-1):c),twodigit) && ~contains(prodata(i-1,c-2),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
                        numberabove = regexp(prodata(i-1,(c-1):c),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c),onedigit) && contains(prodata(i-1,c:(c+1)),twodigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
                        numberabove = regexp(prodata(i-1,c:(c+1)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c-1),onedigit) && ~contains(prodata(i-1,c+1),onedigit)
                        numberabove = regexp(prodata(i-1,c),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   end
                   
                   if contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c-1):(c+1)),threedigit)
                        numberabove = regexp(prodata(i-1,(c-1):(c+1)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,c:(c+2)),threedigit)
                        numberabove = regexp(prodata(i-1,c:(c+2)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+3)),threedigit)
                        numberabove = regexp(prodata(i-1,(c+1):(c+3)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c+1),onedigit) && contains(prodata(i-1,(c+1):(c+2)),twodigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+3),onedigit)
                        numberabove = regexp(prodata(i-1,(c+1):(c+2)),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   elseif contains(prodata(i-1,c+1),onedigit) && ~contains(prodata(i-1,c),onedigit) && ~contains(prodata(i-1,c+2),onedigit)
                        numberabove = regexp(prodata(i-1,c+1),'[0-9]','match');
                        numberabove = str2double(cell2mat(numberabove));
                   end