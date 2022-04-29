disp('Creating test data')
create_test_data

% cfg.source = str2func('driftDetect_subsystem');
% cfg.toplevel = 1;
% cfg.name = 'newsys';
% args = {};
% xBlock(cfg, args);

% open simulink
disp('Opening drift detector model')
open_system('driftDetect');

disp('Netlist generation started')
% Invoke netlist generation
status = xlGenerateButton( [gcs, '/ System Generator'] )

fileID = fopen('sysgen_done.log','w');

if status == 0
    str = 'Netlist generation completed.\n';
    disp(str(1:end-2));
    fprintf(fileID, str);
    fprintf(fileID, 'Passed!\n');
else
    str = sprintf('Netlist generation error, status: %i.\n', status);
    disp(str(1:end-2));
    fprintf(fileID, str);
    fprintf(fileID, 'Failed!\n');
    error('Error occured during IP Generation from SystemGenerator');
end

save_system();
close_system();

fclose(fileID);

exit();
