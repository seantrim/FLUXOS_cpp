

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
    elseif strcmp(batch_dir,'batch_1_select_paper')
         if (yearselect==2009)
            resultdir_list = {...
                        't_49_paper',...
                        };
        elseif (yearselect==2010)
            resultdir_list = {...
                        't_65_paper',...
                        };
        elseif (yearselect==2011)
           resultdir_list = {...
                        't_36_paper',...
                         };
         end
    elseif strcmp(batch_dir,'batch_1_selected_paper_CRHM')
         if (yearselect==2009)
            resultdir_list = {...
                        't_49_paper_crhm',...
                        };
        elseif (yearselect==2010)
            resultdir_list = {...
                        't_65_paper_crhm',...
                        };
        elseif (yearselect==2011)
           resultdir_list = {...
                        't_36_paper_crhm',...
                         };
         end
    elseif strcmp(batch_dir,'batch_1_selected_paper_additional') || strcmp(batch_dir,'batch_1_selected_paper_additional_noIC') || ...
            strcmp(batch_dir,'batch_1_selected_paper_additional_graham') || strcmp(batch_dir,'batch_1_selected_paper_additional_noIC_graham') || ...
            strcmp(batch_dir,'batch_1_selected_paper_additional_previousFLUXOSversion') || strcmp(batch_dir,'batch_1_selected_paper_additional_previousFLUXOSversion_graham') 
         if (yearselect==2005)
            resultdir_list = {...
                        '2005',...
                        };
        elseif (yearselect==2006)
            resultdir_list = {...
                        '2006',...
                        };
        elseif (yearselect==2012)
            resultdir_list = {...
                        '2012',...
                        };
        elseif (yearselect==2013)
            resultdir_list = {...
                        '2013',...
                        }; 
        elseif (yearselect==2014)
            resultdir_list = {...
                        '2014',...
                        }; 
        elseif (yearselect==2015)
            resultdir_list = {...
                        '2015',...
                        }; 
         end
    end
    
    for i = 1:numel(resultdir_list)
        resultdir_list{i} = [FLUXOS_res_dir,batch_dir,'/',resultdir_list{i},'/Results/'];
    end

    % OBSERVATIONS
    ObsPath = '';
    dirobs = '/media/dcosta/data/megasync/ec_main/models/fluxos/support/STC_data_pre-processing/0_Obs/1_Compiled_for_FLUXOS_validation/';
    if (yearselect==2005 && ResType == 1)
        ObsPath = [dirobs,'2005_Compiled/2005_trimmed.csv'];
    elseif (yearselect==2006 && ResType == 1)
        ObsPath = [dirobs,'2006_Compiled/2006_trimmed.csv'];
    elseif (yearselect==2009 && ResType == 1)
        ObsPath = [dirobs,'2009_Compiled/Streamflow_MS9C_2009_trimmed_for_simulation.csv'];
    elseif (yearselect==2010 && ResType == 1)
        ObsPath = [dirobs,'2010_Compiled/Streamflow_MS9C_2010_trimmed_to_simulation.csv'];
    elseif (yearselect==2011 && ResType == 1)
        ObsPath = [dirobs,'2011_Compiled/Snowmelt_Runoff_MS9_2011_justflow.csv'];
    elseif (yearselect==2012 && ResType == 1)
        ObsPath = [dirobs,'2012_Compiled/2012_trimmed.csv'];
    elseif (yearselect==2013 && ResType == 1)
        ObsPath = [dirobs,'2013_Compiled/2013_trimmed.csv'];
    elseif (yearselect==2014 && ResType == 1)
        ObsPath = [dirobs,'2014_Compiled/2014_trimmed.csv'];
    elseif (yearselect==2015 && ResType == 1)
        ObsPath = [dirobs,'2015_Compiled/2015_trimmed.csv'];
    elseif (yearselect==2009 && ResType == 2 || ResType == 3)
        ObsPath = [dirobs,'2009_Compiled/Streamflow_WQ_MS12_2009.csv'];
    elseif (yearselect==2010 && ResType == 2 || ResType == 3)
        ObsPath = [dirobs,'2010_Compiled/Streamflow_WQ_MS12_2010.csv'];
    elseif (yearselect==2011 && ResType == 2 || ResType == 3)
        ObsPath = [dirobs,'2011_Compiled/Streamflow_WQ_MS12_2011.csv'];
    else
        disp('No match for obs file: change yearlect and/or ResType')
    end
    
end