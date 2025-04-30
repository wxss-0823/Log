# CCDF

## 1. CCDF

### 1.1. CDF

​	累计分布函数（Cumulative Distribution Function，CDF），又叫分布函数，是概率密度函数的积分，能完整描述一个实随机变量 X 的概率分布。一般以大写 CDF 标记，于概率密度函数（Probability Density Function，PDF）相对。

​	对于所有实数，累计分布函数定义如下：
$$
F_X(x) = P(X \le x)
$$
​	即累计分布函数表示，对离散变量而言，所有小于等于 a 的值出现的概率和。

### 1.2. CCDF

​	互补累计分布函数（Complementary Cumulative Distribution Function，CCDF），为了表示 OFDM 系统中的峰均比 PAPR 的统计特性所引入的概念，它定义为多载波传输系统中均值超过某一门限值 z 的概率。
$$
F(a) = P(x \gt a)
$$

### 1.3. PAPR

​	峰值平均功率比（Peak to Average Power Radio，PAPR），简称峰均比。工程应用上，一般以 CCDF 的概率为 0.01% 时所对应峰均比，即超过该峰均比的概率为 0.01%，作为多载波传输系统的最大峰均比 。

## 2. dB Unit

### 2.1. dB

​	dB 用来描述两个功率的比值的对数幅度。
$$
dB = 10 \cdot \log(P/P_0) = 20 \cdot \log(U/U_0)
$$

### 2.1. dBW

​	dBW 用来描述单位为瓦特（W）的功率的对数幅度。
$$
dBW = 10 \cdot \log (P/1\ W)
$$

### 2.2. dBm

​	dBm 用来描述单位为毫瓦（mW）的功率的对数幅度，比 dBW 大 30 。
$$
dBm = 10 \cdot \log(P/1 \ mW)
$$
​	如果单位变为毫伏（mV），公式与 dB 相比有一些不同：
$$
dBm = 10 \cdot \log (U^2/Z) \\\\
= 20 \cdot \log (U) - 10 \cdot \log (Z)
$$

### 2.3. dBfs

​	dBfs 用来描述数字域信号功率的对数幅度，与 dBm 的换算关系因不同 AD 模块而有所差异。DA 以输入电压作为量化标准，精度取决于转换位数。一般情况下，总会将最大的模拟域电压幅度对应转化为最大二进制数。

​	例如：输入 -12 dBm 的模拟域功率，射频走线特性阻抗 Z 为 50 $\Omega$ ，此时输入 DA 的模拟电压约为 1.78 mV 。假设 DA 的位数为 16 bit，此时的电压会被映射为 $2^{17} - 1$ ，那么此时 $dBfs = dBm+12$ 。

​	设当前采样的二进制数为 b ，DA 的转换位数为 a ，二进制采样值与 dBfs 的换算公式为：
$$
dBfs = 20 \cdot \log(b/2^a)
$$
**注意**：当采样 bit 减小一位，即十进制值缩小一半时，dBfs 减小 6 dB ；对应量化电平 U 缩小一半，即 dBm 减小 6 dB 。
