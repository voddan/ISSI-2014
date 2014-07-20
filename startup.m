setenv('VLFEATROOT', '/usr/share/matlab/matlab')

% global libs
run('/usr/share/matlab/vlfeat-0.9.18/toolbox/vl_setup.m')
addpath('/usr/share/matlab/ScreenCapture/')

% local libs
addpath(genpath('/home/voddan/Program/MatLab/lib'))
addpath(genpath('/home/voddan/Program/MatLab/images'))
