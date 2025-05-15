# set mannual mode
set_pa_proto_debugmode 1

# reset gate voltage
set_pa_vgs 0 0 0 0
set_pa_vgs 0 0 1 0
set_pa_vgs 0 0 2 0
set_pa_vgs 0 0 3 0

set_pa_vgs 0 1 0 0
set_pa_vgs 0 1 1 0
set_pa_vgs 0 1 2 0
set_pa_vgs 0 1 3 0

set_pa_vgs 0 2 0 0
set_pa_vgs 0 2 1 0
set_pa_vgs 0 2 2 0
set_pa_vgs 0 2 3 0

set_pa_vgs 0 3 0 0
set_pa_vgs 0 3 1 0
set_pa_vgs 0 3 2 0
set_pa_vgs 0 3 3 0

# procedure
第一步：设置3 首先设置1.5V，每次增加0.03读取电流，电流达到80mA后，每次增加或者减少0.005，电流期望110mA 
第二步：设置2 为1.7 每次增加或减少0.005，电流期望130mA
第三步：设置1 首先设置1.5V，每次增加0.03读取电流，电流达到900mA后，每次增加或者减少0.005，电流期望1130mA
第四步：设置0 为0.95

###################################
# CH0
set_pa_mode 0 0 1

# SET
set_pa_vgs 0 0 3 2.33
set_pa_vgs 0 0 2 1.9
set_pa_vgs 0 0 1 2.215
set_pa_vgs 0 0 0 0.95

# SAVE（常温，低温，高温）
save_pa_normal_vgs 0 0 3 30 2.33
save_pa_normal_vgs 0 0 2 30 1.9
save_pa_normal_vgs 0 0 1 30 2.215
save_pa_normal_vgs 0 0 0 30 0.95
set_pa_mode 0 0 0
###################################

###################################
# CH1
set_pa_mode 0 1 1

# SET
set_pa_vgs 0 1 3 2.34
set_pa_vgs 0 1 2 1.9
set_pa_vgs 0 1 1 2.204
set_pa_vgs 0 1 0 0.95

# SAVE（常温，低温，高温）
save_pa_normal_vgs 0 1 3 31 2.34
save_pa_normal_vgs 0 1 2 31 1.9
save_pa_normal_vgs 0 1 1 31 2.204
save_pa_normal_vgs 0 1 0 31 0.95
set_pa_mode 0 1 0
###################################

###################################
# CH2
set_pa_mode 0 2 1

# SET
set_pa_vgs 0 2 3 2.33
set_pa_vgs 0 2 2 1.89
set_pa_vgs 0 2 1 2.214
set_pa_vgs 0 2 0 0.95

# SAVE（常温，低温，高温）
save_pa_normal_vgs 0 2 3 31 2.33
save_pa_normal_vgs 0 2 2 31 1.89
save_pa_normal_vgs 0 2 1 31 2.214
save_pa_normal_vgs 0 2 0 31 0.95
set_pa_mode 0 2 0
###################################

###################################
# CH3
set_pa_mode 0 3 1

# SET
set_pa_vgs 0 3 3 2.33
set_pa_vgs 0 3 2 1.89
set_pa_vgs 0 3 1 2.204
set_pa_vgs 0 3 0 0.95

# SAVE（常温，低温，高温）
save_pa_normal_vgs 0 3 3 31 2.33
save_pa_normal_vgs 0 3 2 31 1.89
save_pa_normal_vgs 0 3 1 31 2.204
save_pa_normal_vgs 0 3 0 31 0.95
set_pa_mode 0 3 0
###################################
