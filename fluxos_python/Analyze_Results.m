
%%%%%%%%%%% OBSERVATIONS %%%%%%%%%%%%%%%%%% 
yearselect = 2009;
ResType = 1; %1-flow, 2-WQ, 3-SQ
Obs_col = 2;      % FLOW: Obs_col = 2 
                  % NH4: Obs: Obs_col = 2 
                  % DOC: Obs_col = 3
                  % SUSPC: Obs_col = 4 	
                  % TOC: Obs_col = 5
                  % NO3NO2: Obs_col = 6 
                  % SUSPN: Obs_col = 7 
                  % TDN: Obs_col = 8
                  % TN: Obs_col = 9
                  % SUSPP: Obs_col = 10 	
                  % TP: Obs_col = 11
                  % TDP: Obs_col = 12 
                  % SRP: Obs_col = 13
                  % TSS: Obs_col = 14
lag = 8; % in hours

FLUXOS_res_dir = '/media/dcosta/DATADRIVE1/fluxos_tests/SIMULATIONS_sync/';
batch_dir = 'batch_1';


if ResType == 1
    outfilenam = 'f.out';
elseif ResType == 2
    outfilenam = 'wq.out';
elseif ResType == 3
    outfilenam = 'sq.out';
end

if (yearselect==2009)
   fluxos_timestart = 39913.01042 + 695422 - lag/24; 
elseif (yearselect==2010)
   fluxos_timestart = 40252.03125 + 695422 - lag/24;       
elseif (yearselect==2011)
    fluxos_timestart = 40633 + 695422 - lag/24;  
end

[resultdir_list, obsPath] = get_resultdir_list(FLUXOS_res_dir,batch_dir,yearselect,ResType);

% Load Obs
obsdata = importdata(obsPath);
%time_obs = cumsum([0; diff(obsdata.data(:,1))])*24; % days -> hour
time_obs = obsdata.data(:,1) +  695422;
data_obs = obsdata.data(:,Obs_col);

%%%%%%%%% MODEL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
resultdir_legend = {};
plot(time_obs,data_obs,'ok')
hold on
timmod_min = [];
timmod_max = [];
for i = 1:numel(resultdir_list)

% load FLUXOS cs results
try
    res = importdata([resultdir_list{i},'/cs/',outfilenam]);
    resultdir_legend = [resultdir_legend,resultdir_list{i}];
catch
    disp(['Result (f.out) not found for: "',resultdir_list{i},'" (SKIPPED)'])
    continue
end

% Results
time_mod = fluxos_timestart + res(:,1)/(3600*24); % sec -> hour
data_mod = res(:,2:end);
timmod_min = min([timmod_min; time_mod]);
timmod_max = max([timmod_max; time_mod]);

%subplot(211)
%time_surf = repmat(time_mod',numel(data_mod(1,:)),1)';
%crosec_surf = repmat((1:1:numel(data_mod(1,:)))',1,numel(time_mod))';
%surf(time_surf,crosec_surf,data_mod)
%axis tight
%shading interp
%alpha 0.8
%view(0,90)
%subplot(212)
plot(time_mod,(sum(data_mod'))','linewidth',2,'Color',[0 0 0]+1/(numel(resultdir_list)+5) * i)
hold on

end
%xlabel('Time [hour]')
if ResType == 1
    ylabel('Flow [m3/s]')
    ylim([0 1.8])
elseif ResType == 2
    ylabel('Conc [mg/l]')
    ylim([0 1.8])
end

axis tight

xlim([timmod_min timmod_max])
grid on
legend(['obs',resultdir_legend],'interpreter','none')
title(yearselect)
datetick('x','dd-mmm','keeplimits','keepticks')
