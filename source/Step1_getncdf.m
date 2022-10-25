%% Getting data from FOAM ncdfs
%We get the temperatures as a 4D matrice from the ncdf and other data

%% load latitude and longitude

latdef= ncread('460tc_1316.46W_EccN_ocean_6720ppm_light.nc', 'lat');
longdef = ncread('460tc_1316.46W_EccN_ocean_6720ppm_light.nc', 'lon');

%% Now we get the PAL

Song(1).PAL = 192;
Song(2).PAL = 96;
Song(3).PAL = 48;
Song(4).PAL = 24;
Song(5).PAL = 8;
Song(6).PAL = 6.1;
Song(7).PAL = 4;

%% get geological times
nb = length([Song]);

for i = 1:nb
    Song(i).geotimes = -500 +10*i;
end

%% Now the temperatures, as 4D matrices

if scenario_Song == 'y'
    Song(1).ncdf = ncread('490tc_1313.24W_EccN_ocean_53760ppm_light.nc', 'TEMP');
    Song(2).ncdf = ncread('480tc_1314.31W_EccN_ocean_26880ppm_light.nc', 'TEMP');
    Song(3).ncdf = ncread('470tc_1315.38W_EccN_ocean_13440ppm_light.nc', 'TEMP');
    Song(4).ncdf = ncread('460tc_1316.46W_EccN_ocean_6720ppm_light.nc', 'TEMP');
    Song(5).ncdf = ncread('450tc_1317.54W_EccN_ocean_2240ppm_light.nc', 'TEMP');
    Song(6).ncdf = ncread('440tc_1318.62W_EccN_ocean_1736ppm_light.nc', 'TEMP');
    Song(7).ncdf = ncread('430tc_1319.7W_EccN_ocean_1120ppm_light.nc', 'TEMP');
else
        Song(1).ncdf = ncread('490tc_1313.24W_EccN_ocean_6720ppm.nc', 'TEMP');
        Song(2).ncdf = ncread('480tc_1314.31W_EccN_ocean_26880ppm.nc', 'TEMP');
        Song(3).ncdf = ncread('470tc_1315.38W_EccN_ocean_6720ppm.nc', 'TEMP');
        Song(4).ncdf = ncread('460tc_1316.46W_EccN_ocean_3360ppm.nc', 'TEMP');
        Song(5).ncdf = ncread('450tc_1317.54W_EccN_ocean_2240ppm.nc', 'TEMP');
        Song(6).ncdf = ncread('440tc_1318.62W_EccN_ocean_1820ppm.nc', 'TEMP');
        Song(7).ncdf = ncread('430tc_1319.7W_EccN_ocean_1120ppm.nc', 'TEMP');
end

clear i

%% Same but for 8PAL

Cst8PAL(1).PAL = 8;
Cst8PAL(2).PAL = 8;
Cst8PAL(3).PAL = 8;
Cst8PAL(4).PAL = 8;
Cst8PAL(5).PAL = 8;
Cst8PAL(6).PAL = 8;
Cst8PAL(7).PAL = 8;

for i = 1:nb
    Cst8PAL(i).geotimes = -500 +10*i;
end

Cst8PAL(1).ncdf = ncread('490tc_1313.24W_EccN_ocean_3360ppm_light.nc', 'TEMP');
Cst8PAL(2).ncdf = ncread('480tc_1314.31W_EccN_ocean_3360ppm_light.nc', 'TEMP');
Cst8PAL(3).ncdf = ncread('470tc_1315.38W_EccN_ocean_3360ppm_light.nc', 'TEMP');
Cst8PAL(4).ncdf = ncread('460tc_1316.46W_EccN_ocean_3360ppm_light.nc', 'TEMP');
Cst8PAL(5).ncdf = ncread('450tc_1317.54W_EccN_ocean_3360ppm_light.nc', 'TEMP');
Cst8PAL(6).ncdf = ncread('440tc_1318.62W_EccN_ocean_3360ppm_light.nc', 'TEMP');
Cst8PAL(7).ncdf = ncread('430tc_1319.7W_EccN_ocean_3360ppm_light.nc', 'TEMP');
