
carr_cfg 2 0 1 20 0 1815 1725 46
2:通道
0：载波号
1：NR TDD 2;NR FDD 3;LTE TDD 3;LTE FDD 1
20:带宽
0：子载波间隔0 15K ;1 30K

2110~2165
1920~1975

set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_cfg 0 0 3 40 0 2130 1940 46
carr_cfg 1 0 3 40 0 2130 1940 46
carr_activate 0
carr_activate 1
set_power_control_enable 1


set_power_control_enable 0
carr_inactivate 0
carr_cfg 0 0 3 40 0 2130 1935 46
carr_activate 0
set_power_control_enable 1


set_power_control_enable 0
carr_inactivate 1
carr_cfg 1 0 3 40 0 2130 1940 46
carr_activate 1
set_power_control_enable 1

