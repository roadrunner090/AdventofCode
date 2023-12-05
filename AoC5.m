%AoC5.m
clc;
addpath('day5puzzleinputs');

seeds = importdata('seeds.txt',' ');
seed_soil = importdata('seedtosoil.txt', ' ');
soil_fertilizer = importdata('soiltofertilizer.txt', ' ');
fertilizer_water = importdata('fertilizertowater.txt', ' ');
water_light = importdata('watertolight.txt', ' ');
light_temperature = importdata('lighttotemperature.txt', ' ');
temperature_humidity = importdata('temperaturetohumidity.txt', ' ');
humidity_location = importdata('humiditytolocation.txt', ' ');
tic;
seedresult = seeds;
hitcount = 0;
mapnumber = 1;
checkvalue = 0;
checkvalue2 = 0;
for i = 19
seeds1 = seeds(i):(seeds(i)+seeds(i+1));
end
seedresult = seeds1;
toc;

%% algorithm.
tic;
for i = 1:length(seedresult)
    %seed to soil
    for j = 1:height(seed_soil)
        if seedresult(i) >= seed_soil(j,2) && seedresult(i) <= (seed_soil(j,2)+seed_soil(j,3)-1)
            seedresult(i) = seedresult(i) - (seed_soil(j,2)-seed_soil(j,1));
            break;
        end        
    end
    
    %soil to fert
    for k = 1:height(soil_fertilizer)
        if seedresult(i) >= soil_fertilizer(k,2) && seedresult(i) <= (soil_fertilizer(k,2)+soil_fertilizer(k,3)-1)
            seedresult(i) = seedresult(i) - (soil_fertilizer(k,2)-soil_fertilizer(k,1));
            break;
        end
    end
            
    %fert to water
    for l = 1:height(fertilizer_water)
        if seedresult(i) >= fertilizer_water(l,2) && seedresult(i) <= (fertilizer_water(l,2)+fertilizer_water(l,3)-1)
            seedresult(i) = seedresult(i) - (fertilizer_water(l,2)-fertilizer_water(l,1));
            break;
        end
    end
 
    %water to light
    for m = 1:height(water_light)
        if seedresult(i) >= water_light(m,2) && seedresult(i) <= (water_light(m,2)+water_light(m,3)-1)
            seedresult(i) = seedresult(i) - (water_light(m,2)-water_light(m,1));
        end
    end
    
    %light to temp
    for n = 1:height(light_temperature)
        if seedresult(i) >= light_temperature(n,2) && seedresult(i) <= (light_temperature(n,2)+light_temperature(n,3)-1)
            seedresult(i) = seedresult(i) - (light_temperature(n,2)-light_temperature(n,1));
            break;
        end
    end
    
    %temp to humid
    for o = 1:height(temperature_humidity)
        if seedresult(i) >= temperature_humidity(o,2) && seedresult(i) <= (temperature_humidity(o,2)+temperature_humidity(o,3)-1)
            seedresult(i) = seedresult(i) - (temperature_humidity(o,2)-temperature_humidity(o,1));
            break;
        end
    end
    
    %humid to loc
    for p = 1:height(humidity_location)
        if seedresult(i) >= humidity_location(p,2) && seedresult(i) <= (humidity_location(p,2)+humidity_location(p,3)-1)
            seedresult(i) = seedresult(i) - (humidity_location(p,2)-humidity_location(p,1));
            break;
        end
    end
    
end

lowestloc = min(seedresult);
toc;

%ik heb handmatig die ranges erin gejakkert, want ik ben een EE makker die
%het graag moeilijk maakt voor jullie. Bedankt voor het lezen van mijn
%code, is erg cash money van jou.        

%Oh, jij wou natuurlijk nog een filmpje! Bijna vergeten. Poeh, ik moet even
%grabbelen hoor. *trommelgeluiden* "GROOOOOEEEEN!" Ja, ik heb een filmpje
%voor je: https://www.youtube.com/watch?v=KGAAhzreGWw
%Ik probeer hier wel altijd muziek als filmpje te hebben, maar als de goede
%nummers opzijn doe ik wel meme videos.


