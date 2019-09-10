

function [resultdir_list, ObsPath] = get_resultdir_list(FLUXOS_res_dir,batch_dir,yearselect,ResType)

    % SIMULATION RESULTS
    if strcmp(batch_dir,'batch_1') % BATCH 1
        if (yearselect==2009)
            resultdir_list = {...
                        't_55',...
                        't_52',...
                        't_40',...
                        't_45',...
                        't_57',...
                        't_46',...
                        't_59',...
                        't_49',...
                        't_64',...
                        };
        elseif (yearselect==2010)
            resultdir_list = {...
                        't_56',...
                        't_53',...
                        't_41',...
                        't_44',...
                        't_58',...
                        't_47',...
                        't_60',...
                        't_50',...
                        't_65',...
                        };
        elseif (yearselect==2011)
           resultdir_list = {...
                        't_51',...
                        't_36',...
                        't_39',...
                        't_54',...
                        't_43',...
                        't_35',...
                        't_48',...
                        't_37',...
                        't_66',...
                         };
        end

    elseif strcmp(batch_dir,'batch_2') % BATCH 2

        if (yearselect==2009)
            resultdir_list_nums = [67:1:92];
        elseif (yearselect==2010)
            resultdir_list_nums = [93:1:118];
        elseif (yearselect==2011)
           resultdir_list_nums = [119:1:144];
        end

        resultdir_list = {};
        for i = 1:numel(resultdir_list_nums)
            resultdir_list{i} = ['t_',mat2str(resultdir_list_nums(i))];
        end
  
    end
    
    for i = 1:numel(resultdir_list)
        resultdir_list{i} = [FLUXOS_res_dir,batch_dir,'/',resultdir_list{i},'/Results/'];
    end

    % OBSERVATIONS
    ObsPath = '';
    if (yearselect==2009 && ResType == 1)
        ObsPath = '/media/dcosta/DATADRIVE1/MegaSync/FLUXOS/STC_data_pre-processing/0_Obs/1_Compiled_for_FLUXOS_validation/1_2009_Compiled/Streamflow_MS9C_2009_trimmed_for_simulation.csv';
    elseif (yearselect==2010 && ResType == 1)
        ObsPath = '/media/dcosta/DATADRIVE1/MegaSync/FLUXOS/STC_data_pre-processing/0_Obs/1_Compiled_for_FLUXOS_validation/2_2010_Compiled/Streamflow_MS9C_2010_trimmed_to_simulation.csv';
    elseif (yearselect==2011 && ResType == 1)
        ObsPath = '/media/dcosta/DATADRIVE1/MegaSync/FLUXOS/STC_data_pre-processing/0_Obs/1_Compiled_for_FLUXOS_validation/3_2011_Compiled/Snowmelt_Runoff_MS9_2011_justflow.csv';
    elseif (yearselect==2009 && ResType == 2 || ResType == 3)
        ObsPath = '/media/dcosta/DATADRIVE1/MegaSync/FLUXOS/STC_data_pre-processing/0_Obs/1_Compiled_for_FLUXOS_validation/1_2009_Compiled/Streamflow_WQ_MS12_2009.csv';
    elseif (yearselect==2010 && ResType == 2 || ResType == 3)
        ObsPath = '/media/dcosta/DATADRIVE1/MegaSync/FLUXOS/STC_data_pre-processing/0_Obs/1_Compiled_for_FLUXOS_validation/2_2010_Compiled/Streamflow_WQ_MS12_2010.csv';
    elseif (yearselect==2011 && ResType == 2 || ResType == 3)
        ObsPath = '/media/dcosta/DATADRIVE1/MegaSync/FLUXOS/STC_data_pre-processing/0_Obs/1_Compiled_for_FLUXOS_validation/3_2011_Compiled/Streamflow_WQ_MS12_2011.csv';
    else
        disp('No match for obs file: change yearlect and/or ResType')
    end
    
end