%belowcode.m

if contains(prodata(i+1,c-1),onedigit)
    numberbelow = regexp(prodata(i+1,(c-3):(c-1)),'[0-9]','match');
    numberbelow = str2double(cell2mat(numberbelow));
elseif contains(prodata(i+1,c),onedigit)
    numberbelow = regexp(prodata(i+1,(c-1):(c+1)),'[0-9]','match');
    numberbelow = str2double(cell2mat(numberbelow));
elseif contains(prodata(i+1,c+1),onedigit)
    numberbelow = regexp(prodata(i+1,(c+1):(c+3)),'[0-9]','match');
    numberbelow = str2double(cell2mat(numberbelow));
end 

%old belowcode:

                   if contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-3):(c-1)),threedigit)
                        numberbelow = regexp(prodata(i+1,(c-3):(c-1)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c-1),onedigit) && contains(prodata(i+1,(c-2):(c-1)),twodigit) && ~contains(prodata(i+1,(c-3)),onedigit) && ~contains(prodata(i+1,c),onedigit)
                        numberbelow = regexp(prodata(i+1,(c-2):(c-1)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-2),onedigit)
                        numberbelow = regexp(prodata(i+1,c-1),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   end
                   
                   
                   if contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-2):(c)),threedigit)
                        numberbelow = regexp(prodata(i+1,(c-2):(c)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,(c-1):c),twodigit) && ~contains(prodata(i+1,c-2),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
                        numberbelow = regexp(prodata(i+1,(c-1):c),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c),onedigit) && contains(prodata(i+1,c:(c+1)),twodigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
                        numberbelow = regexp(prodata(i+1,c:(c+1)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c-1),onedigit) && ~contains(prodata(i+1,c+1),onedigit)
                        numberbelow = regexp(prodata(i+1,c),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   end
                   
                   if contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c-1):(c+1)),threedigit)
                        numberbelow = regexp(prodata(i+1,(c-1):(c+1)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,c:(c+2)),threedigit)
                        numberbelow = regexp(prodata(i+1,c:(c+2)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+3)),threedigit)
                        numberbelow = regexp(prodata(i+1,(c+1):(c+3)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c+1),onedigit) && contains(prodata(i+1,(c+1):(c+2)),twodigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+3),onedigit)
                        numberbelow = regexp(prodata(i+1,(c+1):(c+2)),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   elseif contains(prodata(i+1,c+1),onedigit) && ~contains(prodata(i+1,c),onedigit) && ~contains(prodata(i+1,c+2),onedigit)
                        numberbelow = regexp(prodata(i+1,c+1),'[0-9]','match');
                        numberbelow = str2double(cell2mat(numberbelow));
                   end       
  