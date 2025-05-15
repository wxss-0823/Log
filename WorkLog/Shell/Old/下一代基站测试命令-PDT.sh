+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+                                                                         +
+      nBCCP板PDT测试模式加载程序方法（修改时间2017-11-3，李楠）          +
+                                                                         +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

注意：
（1）以下1~10部串口命令为更换boot与vmlinux，且让vmlinux从flash启动的方法。
（2）若板子已设置为从flash启动且不需要更换boot和vmlinux，从第11步开始做。
（3）板子上复位键（相当于重启）：位号U4，大晶振的左下角。

=====================以下命令及打印在串口界面中==================
1.设置串口，波特率为115200，注意与转接板相连的线缆接在设备“BSR2”口子

2.CP板上电，出现以下打印时（此时屏幕会停几秒），赶紧按回车
DTT0: Failed init!
DTT1: Failed init!
MMC: 

3.出现以下界面后，若需要配置小板IP，输入Exit cmd对应数字（不一定如下面显示为7），然后按回车
###################### User Menu for NBCCP#####################
[1] Boot image form net
[2] Boot image form flash
[3] Boot image from SD
[4] Burn uboot form net
[5] Burn stage 1&2 uboot form net
[6] Burn image from net
[7] Exit cmd

4.出现“Octeon sff7000(ram)# ”打印时，将以下命令输入并回车。其中serverip是本地电脑ip，ipaddr是CP板ip，
两者需在同一网段。
setenv ethact octeth17
setenv ethprime octeth1
setenv serverip 192.168.0.98
setenv ipaddr 192.168.0.100
ping 192.168.0.98 
saveenv
--注意输入ping 192.168.0.98时，若出现以下打印，表示板子可ping通电脑IP
Using octeth1 device
host 192.168.0.98 is alive
reset  //输入此命令重启板子


5.重复第2步

6.出现以下界面后，若需要下载boot，输入Burn uboot form net对应数字（不一定如下面显示为4），然后按回车
###################### User Menu for NBCCP#####################
[1] Boot image form net
[2] Boot image form flash
[3] Boot image from SD
[4] Burn uboot form net
[5] Burn stage 1&2 uboot form net
[6] Burn image from net
[7] Exit cmd

7.出现以下打印，且又出现第6步的面时，输入Exit cmd对应数字，然后输入reset重启板子
Enter your Selection:4
tftp u-boot-octeon_sff7000.bin
Using octeth1 device
TFTP from server 192.168.0.119; our IP address is 192.168.0.110
Filename 'u-boot-octeon_sff7000.bin'.
Load address: 0x20000000
Loading: octeth1: Unknown PHY compatibility
Up 1000 Mbps Full duplex (port 16) (SGMII)
##################################################
         2.5 MiB/s
done
Bytes transferred = 1536232 (1770e8 hex)
SF: Detected MX25L12805 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
SF: 1048576 bytes @ 0x100000 Erased: OK
1048576 bytes written, 487656 bytes skipped in 7.659s, speed 205285 B/s

8.重复第2步

9.出现以下界面后，若需要将vmlinux
下到flash中，输入Burn image from net对应数字（不一定如下面显示为6），然后按回车
###################### User Menu for NBCCP#####################
[1] Boot image form net
[2] Boot image form flash
[3] Boot image from SD
[4] Burn uboot form net
[5] Burn stage 1&2 uboot form net
[6] Burn image from net
[7] Exit cmd

10.下载需要几分钟，最后出现以下打印，且又回到第9步的界面时，输入2（Boot image form flash）
Erased 560 sectors
Copy to Flash... done

11.板子会正常启动，直到出现以下打印
BusyBox v1.20.2 (2017-03-18 15:32:02 CST) built-in shell (ash)
Enter 'help' for a list of built-in commands.

~ # 
然后输入以下命令，若出现“
*********************** BSEY boot end. *************************”这条打印，只需要输入最后两条命令。
mount /dev/mtdblock2 /mnt

如果MOUNT失败，

1.
cd /mnt/image/
insmod cpld.ko
insmod dm642.ko
/sbin/mdev -s
schedtool -a 0x02 -e ./LINUX_BSEYIMAGE
ifconfig eth1 192.168.0.112 up  //设置板子IP
ping 192.168.0.119              //验证是否能ping通电脑


sync



++++++++++++++++++++++++++++++++++++++++++++
12.以下为加载程序命令，在串口界面下输入，必须等CP板启动完成后加载
（1）先ping一下电脑IP，若ping不通，输入“ifconfig eth1 192.168.0.110 up”，再ping一下电脑IP
（2）在串口输入“cd /mnt/image”，切换到/mnt/image目录。若无此目录，输入“cd/mnt”进入/mnt目录，再输入“mkdir image”创建image文件夹
（3）依次输入以下命令，加载程序
tftp -gr cpld.ko 192.168.0.98
tftp -gr dm642.ko 192.168.0.98
tftp -gr PDT_DSPIMAGE.out 192.168.0.98
tftp -gr PDT_FPGA.rbf 192.168.0.98
tftp -gr LINUX_BSEYIMAGE 192.168.0.98 -b 20000
加载完后输入“chmod 777 LINUX_BSEYIMAGE”修改LINUX_BSEYIMAGE，再输入“sync”同步一下。

（3）输入“cd /mnt”回到/mnt目录，
tftp -gr etra.sh 192.168.0.98
加载完后输入“chmod 777 etra.sh”，再输入“sync”同步一下
（4）输入“reboot”重启CP板

（5）启动完成后，若网口不通，输入以下命令
ifconfig eth1 192.168.0.112 up  //设置板子IP
ping 192.168.0.119

注意，若CP板已经启动完成，加载LINUX_BSEYIMAGE时，必须做以下操作
ps 看进程，看LINUX_BSEYIMAGE的进程号
kill -9 （LINUX_BSEYIMAGE的进程号）   //结束LINUX_BSEYIMAGE进程
++++++++++++++++++++++++++++++++++++++++++++


============================以下命令在网口上输入=========================
登录板子，输入“show-runversion”，除TR外的版本号如下：
VxWorks Image    : 1.0.0.0_test
FPGA Software    : 1.0.0.1
CPLD Software    : 0.0.0.1
BOOT Software    : 2.2.2.2
FPGA120 Software : 1.0.0.1
DSP Software     : 1.0.1.1

:SHOW-TASK-INFO;  //看上层任务
-------------------------------------

//单载波环回测试
:stop-test;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;
:set-bbp-param:regid=127,value=0x100;
:start-count-error:sample=300,time=1;


//两载波环回测试
:stop-test;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;
:start-count-error:sample=300,time=1;

//三载波环回测试
:stop-test;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;  //LOOP标志位
:start-count-error:sample=300,time=1;

//四载波环回测试
:stop-test;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=22;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:sET-BBP-PARAM:regid=44,value=0x34a;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;  
:start-count-error:sample=300,time=1;



:stop-test;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:START-BBPP-LOOP;
:SET-TESTPARA:bursttype=28;
:SET-TEST-PRINT:value=7;
:set-bbp-param:regid=38,value=0;
:set-bbp-param:regid=95,value=0;
:set-bbp-param:regid=36,value=0x4ce;   
:set-bbp-param:regid=127,value=0x100;  
:start-count-error:sample=300,time=1;
-------------------------------------

//单载波发射
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384.5;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=45;




:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=366.2;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=47;



:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=361;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;




:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=366;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

//两载波发射
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384;
:set-trpa-freq:carrierid=2,freq=384.5;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;



:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384;
:set-trpa-freq:carrierid=2,freq=384.5;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363;
:set-trpa-freq:carrierid=2,freq=363.15;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;


:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=364.9875;
:set-trpa-freq:carrierid=2,freq=365.9875;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

//三载波发射

:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384;
:set-trpa-freq:carrierid=2,freq=384.5;
:set-trpa-freq:carrierid=3,freq=385;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;




:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=365.4875;
:set-trpa-freq:carrierid=2,freq=365.7375;
:set-trpa-freq:carrierid=3,freq=365.9875;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;



:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=361.0125;
:set-trpa-freq:carrierid=2,freq=361.2625;
:set-trpa-freq:carrierid=3,freq=361.5125;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

//四载波发射
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=382.0125;
:set-trpa-freq:carrierid=2,freq=382.0125;
:set-trpa-freq:carrierid=3,freq=382.0125;
:set-trpa-freq:carrierid=4,freq=382.0125;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=45;

:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1;
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=382;
:set-trpa-freq:carrierid=2,freq=382.25;
:set-trpa-freq:carrierid=3,freq=382.5;
:set-trpa-freq:carrierid=4,freq=382.75;
:START-Tx-test;
:SET-TESTPARA:bursttype=9;
:SET-BBP-PARAM:regid=38,value=0;
:set-trpa-paswitch:value=1;
:set-trpa-power:value=49;

-------------------------------------

//单载波接收
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=360.8125;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=366.1875;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

//两载波接收
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=2,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5125;
:set-trpa-freq:carrierid=2,freq=364.5125;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

//三载波接收
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=3,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5125;
:set-trpa-freq:carrierid=2,freq=364.5125;
:set-trpa-freq:carrierid=3,freq=365.5125;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

//四载波接收
:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=386.9875;
:set-trpa-freq:carrierid=2,freq=386.9875;
:set-trpa-freq:carrierid=3,freq=386.9875;
:set-trpa-freq:carrierid=4,freq=386.9875;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=382.5;
:set-trpa-freq:carrierid=2,freq=383.5;
:set-trpa-freq:carrierid=3,freq=384.5;
:set-trpa-freq:carrierid=4,freq=385.5;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;

SOUR:POW:LEV:IMM:AMPL -110 dBm
SOUR:FREQ 355.5MHz


:open-trpa;
:stop-test;
:set-trpa-param:type=0x45,value=1; 
:set-trpa-paswitch:value=0;
:SET-TRPA-MCMODE:mcnum=4,rxnum=1;
:set-trpa-freq:carrierid=1,freq=384.5;
:set-trpa-freq:carrierid=2,freq=384.5;
:set-trpa-freq:carrierid=3,freq=384.5;
:set-trpa-freq:carrierid=4,freq=384.5;
:set-bbp-param:regid=38,value=1;
:set-bbp-param:regid=95,value=1;
:set-rmo-voiceflag:value=1;
:start-rmo-noloop;
:SET-TEST-PRINT:value=15;
:START-COUNT-ERROR:sample=300,time=1;


-------------------------------------

//测接收无用传导发射命令（不管上次处于什么状态）
:stop-test;
:set-trpa-paswitch:value=0;
:SET-trpa-MCMODE:mcnum=1,rxnum=1;
:set-trpa-freq:carrierid=1,freq=363.5;
:START-tx-t1;
-------------------------------------

:get-bbp-param:regid=66;                 
:get-bbp-param:regid=127;              //正常测试置0（默认），环回测试置1
:get-bbp-param:regid=95;               //正常测试置1（默认），环回测试置0
:GET-BBP-PARAM:regid=44;                            
:watch-debug:level=1,fid=20;           //上MAC打印
:watch-debug:level=1,fid=56;           //DSP打印
============================================================================


TR板串口命令：
计算基带信号幅度
[root@zynq /]# cli
cli V1.0 built on Oct 14 2016,02:56:22
dtru> powercalc 0 100000

PA电压查询
dtru> get_pavds
get_pavds(0) = 47.394 ok !

cd  /mnt/flash/patch/bin
tftp 192.168.0.190  -gr  sw_app

cd /mnt/flash/conf
tftp 192.168.0.119  -gr .info.db





:SENS:ACP:OFFS:LIST:FREQ 12.5KHz,25KHz
:SENSe:BANDwidth:RESolution 300Hz
:SENSe:BANDwidth:VIDeo 1KHz




