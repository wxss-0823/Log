# HFSS 学习笔记

## Mesh

​	自定义







## Field Overlays

### Plot Field

​	用于绘制各种场图。

#### E Field

- Mag_E：电场强度幅值；

$$
Mag(E) = \sqrt{Re(E_x)^2 + Re(E_y)^2 + Re(E_z)^2}
$$

- ComplexMag_E：磁场强度复幅值；

$$
Mag(E) = \sqrt{Re(E_x)^2 + Im(E_x)^2 + Re(E_y)^2 + Im(E_y)^2+ Re(E_z)^2 + Im(E_z)^2}
$$

- Vector_H：电场强度矢量。

#### H Field

- Mag_H：电场强度幅值；

- ComplexMag_H：磁场强度复幅值；

- Vector_H：电场强度矢量。

#### J Field

- Mag_Jsurf：面电流密度幅值；
- ComplexMag_Jsurf：面电流密度复幅值；
- Vector_Jsurf：面电流密度矢量；
- Mag_Jvol：体电流密度幅值；
- ComplexMag_Jvol：体电流密度复幅值；
- Vector_Jvol：体电流密度矢量；
- Mag_Jm：磁化电流密度幅值；
- ComplexMag_Jm：磁化面电流密度复幅值；
- Vector_Jm：磁化面电流密度矢量。

#### Q Field

- ABS_Q：电场电荷绝对值；
- SmoothQ：电场电荷平滑；
- ABS_Qm：磁场电荷绝对值；
- SmoothQm：磁场电荷平滑；

#### Other

- Vector_RealPoynting：坡印廷矢量的实部向量；
- Local_SAR：Specific Absorption Rate，局部吸收比；
- Average_SAR：平均吸收比；
- Surface_Loss_Density：表面损耗密度；
- Volume_Loss_Density：体损耗密度；
- Temperature：温度；
- Mag_Displacement：电位移矢量幅度；
- Displacement_Vector：电位移矢量；
- Surface_Force_Density：表面力密度。

### Plot Mesh

​	用于在指定面或者指定体内，画出最后一次计算过程中收敛的网格。

## Optimetrics

### 参数扫描

​	用来分析设计模型的性能随着指定变量的变化而变化的关系。

### 优化设计

​	指 HFSS 软件结合 Optimetrics 模块在一定的约束条件下根据特定的优化算法对设计的某些参数进行调整，从所有可能的设计变化中寻找出一个满足设计要求的值。

​	一般分为一下几步：

1. 初始设计；
2. 定义优化变量；
3. 构造目标函数。

#### 加权函数和规范类型

​	在有些设计中，为了达到设计要求，需要设置多个目标函数。这些目标函数所包含的性能有时也是相互矛盾或相互制约的，一般很难保证全部指标都达到最优。这种情况下，需要给每个函数分配一个加权值，加权值越大，表示该目标函数越重要。

​	HFSS 中定义了三种规范类型：L1 规范类型、L2 规范类型和 Maximum 规范类型。

​	三种规范类型的误差函数定义如下。

| 规范类型 | 定义                    |
| -------- | ----------------------- |
| L1       | $e = \sum_1^N |w_ie_i|$ |
| L2       | $e = \sum_1^N w_ie_i^2$ |
| Maximun  | $e = max_1^N(w_ie_i)$   |

​	式中，$w_i$ 和 $e_i$ 分别代表第 i 个目标函数的加权值和误差值。

### 优化算法

​	Optimetrics 模块支持 5 种优化算法，分别是非线性顺序编程算法（Sequential Nonlinear Programming，SNLP）、混合整数非线性顺序编程算法（Sequential Mixed-Integer Nonlinear Programming，SMINLP）、拟牛顿法（Quasi-Newton）、模式搜索法（Pattern Search）和遗传算法（Genetic Algorithm）。

#### 拟牛顿法

##### 牛顿法简介

​	牛顿法的基本思想是在极小值附近通过对目标函数$ f(x)$ 作二阶泰勒展开，进而找到 $ f(x)$ 的极小点的估计值。考虑在仅有一个目标函数，一个优化变量的情况下，某一点处的泰勒展开函数 $\varphi(x)$ 为：
$$
\varphi(x) = f(x_k) + f'(x_k)(x-x_k) + \frac{1}{2}f''(x_k)(x-x_k)^2
$$
​	预测下一个极值点满足：
$$
\varphi'(x_{k+1}) = f'(x_{k+1}) + f''(x_k)(x_{k+1}-x_k) = 0
$$
​	因此：
$$
x_{k+1} = x_k-\frac{f'(x_k)}{f''(x_k)}
$$
​	将 $x_{k+1}$ 作为 $ f(x)$ 极小点的一个进一步估计值，重复上述过程，可以产生一系列的极小值点集合 $\{x_k\}$ 。一定条件下，这个极小值点收敛于 $ f(x)$ 的极值点。

​	下面，依旧考虑在只有一个目标函数情况下，但将模型的变量扩展至 N 个，目标函数可以表示为 $ f(x_1, x_2, \cdots, x_N)$ ，令 $\mathbf{x} = \{x_1, x_2, \cdots, x_N\}$ ，则 $\mathbf{x}_k = \{x_{k1}, x_{k2}, \cdots, x_{kN}\}$ ，其泰勒展开为：
$$
f(\mathbf{x})\approx\varphi(\mathbf{x}) = f(\mathbf{x}_k) + \nabla f(\mathbf{x}_k)(\mathbf{x}-\mathbf{x}_k) + \frac{1}{2}(\mathbf{x}-\mathbf{x}_k)^T\nabla^2f(\mathbf{x}_k)(\mathbf{x}-\mathbf{x}_k)
$$
​	式中，$\nabla f(\mathbf{x}_k)$ 和 $\nabla^2f(\mathbf{x}_k)$ 分别是目标函数在 $\mathbf{x}_k$ 处的一阶和二阶偏导数，分别对应 N 维向量和 N$\times$N 维矩阵。后者又称为目标函数的 Hesse 矩阵。假设 Hesse 矩阵可逆：
$$
\mathbf{x}_{k+1} = \mathbf{x}_k-[\nabla^2f(\mathbf{x}_k)]^{-1}\nabla f(\mathbf{x}_k)
$$
​	这就是原始的牛顿法迭代公式，牛顿法在计算过程中需要计算目标函数的二阶偏导数和 Hesse 矩阵，难度较大。更为复杂的是目标函数的 Hesse 矩阵无法保持正定，从而令牛顿法失效。

##### 拟牛顿法简介

​	为了解决这个问题，提出了拟牛顿法。拟牛顿法的基本思想是，不直接计算二阶偏导数，用一阶导数构造近似 Hesse 矩阵的逆的对称正定阵。

​	假设我们已经获得了第 k 次迭代后的极小值点集合 $\{\mathbf{x}_{k+1}\}$ ，将目标函数在 $\{\mathbf{x}_{k+1}\}$ 处展开成泰勒级数：
$$
f(\mathbf{x}) \approx f(\mathbf{x}_{k+1}) + \nabla f(\mathbf{x}_{k+1})(\mathbf{x} - \mathbf{x}_{k+1}) + \frac{1}{2}(\mathbf{x}-\mathbf{x}_{k+1})^T\nabla^2f(\mathbf{x}_{k+1})(\mathbf{x}-\mathbf{x}_{k+1})
$$
​	与牛顿法相同，对上式求微分，预测下一个极小值点为泰勒展开一阶导为 0 的点：
$$
\nabla f(\mathbf{x}) \approx \nabla f(\mathbf{x}_{k+1}) + \nabla^2 f(\mathbf{x}_{k+1})(\mathbf{x}-\mathbf{x}_{k+1})
$$
​	由于一般情况下，优化步进很小，假设可以忽略在 $\mathbf{x}_k$ 处，目标函数与目标函数在 $\{\mathbf{x}_{k+1}\}$ 处的泰勒展开式之间的误差，代入 $\mathbf{x}_k$ ：
$$
\nabla f(\mathbf{x}_k) \approx \nabla f(\mathbf{x}_{k+1}) + \nabla^2 f(\mathbf{x}_{k+1})(\mathbf{x}_k-\mathbf{x}_{k+1})
$$
​	即：
$$
\nabla f(\mathbf{x}_{k+1}) - \nabla f(\mathbf{x}_k) \approx \nabla^2 f(\mathbf{x}_{k+1})(\mathbf{x}_{k+1} - \mathbf{x}_k)
$$
​	记：
$$
\mathbf{s}_k = \mathbf{x}_{k+1} - \mathbf{x}_{k},\quad \mathbf{y}_k = \nabla f(\mathbf{x}_{k+1}) - \nabla f(\mathbf{x}_k)
$$
​	同时设 Hesse 矩阵 $\nabla^2 f(\mathbf{x}_{k+1})$ 可逆，上式可以表示为：
$$
\mathbf{s}_k = [\nabla^2 f(\mathbf{x}_{k+1})]^{-1} \cdot \mathbf{y}_k
$$
​	因此，拟牛顿法只需计算目标函数的一阶导数，就可以依据上式估计该处的 Hesse 矩阵，并将新的 Hesse 矩阵用于下一次的预测点拟合。

​	记：
$$
\mathbf{H}_{k+1} = [\nabla^2 f(\mathbf{x}_{k+1})]^{-1}
$$
​	则有：
$$
\mathbf{s}_k = \mathbf{H}_{k+1} \cdot \mathbf{y}_k
$$
​	拟牛顿法只有在目标函数的噪声很小的情况下使用时足够准确的，如果目标函数的噪声在工程上是十分显著的，需要使用模式搜索优化算法得到最优结果。

##### 计算过程

​	在上一节的介绍中，牛顿法使用的前提是假设我们已知了第 k 次迭代后的极小值点集合 $\{\mathbf{x}_{k+1}\}$ 。可是显然，在实际计算过程中，我们不可能提前得知下一个预测极小值点集合。如何在不计算 Hesse 矩阵的前提下，获得下一个预测极小值点集合呢？

​	通常，我们可以得知计算优化参数的起始点，以及该起始点处目标函数的一阶导数，相当于已知了 $\mathbf{x}_0$ 与 $\nabla f(\mathbf{x}_0)$ ，并假设初始的 Hesse 矩阵 $\mathbf{H}_0$ 为单位矩阵 I ，通过牛顿法公式：
$$
\mathbf{x}_{1} = \mathbf{x}_0 - \mathbf{H}_0\nabla f(\mathbf{x}_0)
$$
​	即可求得下一个预测极小值点的集合。将 $\mathbf{x}_1$ 代入目标函数，可以求出目标函数在 $\mathbf{x}_1$ 处的一阶导数 $\nabla f(\mathbf{x}_1)$ ，运用拟牛顿法公式：
$$
\mathbf{s}_0 = \mathbf{H}_{1} \cdot \mathbf{y}_0
$$
​	即可修正 Hesse 矩阵。将新的 Hesse 矩阵 $\mathbf{H}_1$ 用于下一次循环，计算新的预测极小值点集合，重复这个过程，直至优化收敛。

##### 构造公式

​	现在还剩下最后一个问题，如何修正 Hesse 矩阵呢？在 N 个优化参数的使用场景下，$\mathbf{s}_k$ 与 $\mathbf{y}_k$ 均为列向量，我们无法在仅知道列向量的情况下恢复出 N$\times$N 维的 Hesse 矩阵，因为有无数个矩阵满足这个等式。
$$
\mathbf{H}_{k+1} = \frac{\mathbf{y}_k\mathbf{s}^T_k}{\mathbf{s}^T_k\mathbf{s}_k} + \mathbf{B}
\left(\mathbf{I}-\frac{\mathbf{s}_k\mathbf{s}^T_k}{\mathbf{s}^T_k\mathbf{s}_k}
\right)
$$
​	其中，$\mathbf{B}$ 可以是任意矩阵，$\mathbf{I}$ 是单位矩阵。

​	这时候，我们可能需要一些特殊的构造公式，帮助我们构造出可以计算下一个极值点集合的 Hesse 矩阵。

​	DFP （Davidon-Fletcher-Powell Formula）公式是拟牛顿法家族最早的算法，用于求解无约束非线性优化问题，下面是 DFP 公式的核心迭代式：
$$
\mathbf{H}_{k+1} = \mathbf{H}_k - \frac{\mathbf{H}_k\mathbf{y}_k\mathbf{y}^T_k\mathbf{H}_k}{\mathbf{y}^T_k\mathbf{H}_k\mathbf{y}_k} + \frac{\mathbf{s}_k\mathbf{s}^T_k}{\mathbf{y}^T_k\mathbf{s}_k}
$$
​	可以验证，这样迭代产生的 Hesse 矩阵，只要保证 $\mathbf{y}^T_k\mathbf{s}_k > 0$ ，即目标函数在目标参数附近泰勒展开式为二次凸函数，即可保证 $\mathbf{H}_{k+1}$ 正定，且上式满足拟牛顿条件。

​	具体 DFP 公式是如何修正 Hesse 矩阵的呢？简单来说，$\mathbf{H}_k$ 可以看作是一个斜率矩阵，通过这个斜率矩阵，计算出了下一个极小值集合 $\mathbf{x}_{k+1}$ 。但是事实上，从 $\mathbf{x}_k$ 到 $\mathbf{x}_{k+1}$ 的斜率矩阵并不是 $\mathbf{H}_k$ ，$\mathbf{H}_k$ 是从 $\mathbf{x}_{k-1}$ 到 $\mathbf{x}_k$ 的斜率矩阵。所以需要修正下一个斜率矩阵，让其满足拟牛顿公式。假设 $\mathbf{H}_{k+1} = \mathbf{H}_k + \Delta\mathbf{H}$ ，通过待定系数法，可以由 $\mathbf{s}_k$ 与 $\mathbf{y}_k$ 构造出 $\mathbf{H}_{k+1}$ ，这个斜率矩阵即为从 $\mathbf{x}_k$ 到 $\mathbf{x}_{k+1}$ 的斜率矩阵，现在，可以借助新的 Hesse 预测下一个极小值集合了。

​	这个迭代过程继承了 $\mathbf{H}_k$ 中蕴含的斜率信息，确保我们恢复出的斜率矩阵是需要的迭代方向，而不是任意矩阵。

​	除此以外，还有 BFGS（Broyden-Fletcher-Goldfarb-Shanno）公式等。

##### 多维目标函数

​	考虑更为复杂的情况，将目标函数扩展至 M 维，目标函数组表示如下：
$$
F(x_1, x_2, \cdots, x_N) = 
\left\{
\begin{array}{**lr}
f_1(x_1, x_2, \cdots, x_N) \\
f_1(x_1, x_2, \cdots, x_N) \\
\cdots \\
f_M(x_1, x_2, \cdots, x_N)
\end{array}
\right.
$$
​	可以写作向量的形式：
$$
\mathbf{F}(\mathbf{x}) = 
\left[\begin{array}{**lr**}
f_1(\mathbf{x}) \\
f_2(\mathbf{x}) \\
\cdots \\
f_M(\mathbf{x})
\end{array}
\right]
$$
​	此时通常使用一阶泰勒展开拟合目标函数：
$$
\mathbf{F}(\mathbf{x}) \approx \mathbf{F}(\mathbf{x}_k) + \mathbf{J}_\mathbf{F}(\mathbf{x}_k)(\mathbf{x} - \mathbf{x}_k)
$$
​	式中，雅可比矩阵 $\mathbf{J}_\mathbf{F}$ 是一个 M$\times$N 的矩阵，包含了 $\mathbf{F}$ 的所有一阶偏导数：
$$
\mathbf{J}_\mathbf{F}(\mathbf{x}) = 
\left[\begin{matrix}
\frac{\partial f_1}{\partial x_1} & \frac{\partial f_1}{\partial x_2} & \cdots & \frac{\partial f_1}{\partial x_N} \\
\frac{\partial f_2}{\partial x_1} & \frac{\partial f_2}{\partial x_2} & \cdots & \frac{\partial f_2}{\partial x_N} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial f_N}{\partial x_1} & \frac{\partial f_N}{\partial x_2} & \cdots & \frac{\partial f_N}{\partial x_N} \\
\end{matrix}\right]
$$
​	如果需要直接计算 M 个目标函数的极小值，需要对雅可比矩阵再次求导，这样可能导致矩阵阶数过大，无法存储。考虑 HFSS 可能并不是采用这种方式直接优化，推测可能采用优先优化权重大的目标函数，再依次优化其他目标函数，最终保证加权误差最小。

##### 正定的必要性

​	牛顿法的核心思想是，在当前位置用一个二次函数来近似目标函数，然后直接假设二次函数的最小值点作为下一个预测的极值点。为了保证结果收敛，需要确认变量迭代的方向是沿着目标函数下降的方向，即必须满足自变量变化量与目标函数的梯度点积小于 0：
$$
\nabla f(\mathbf{x})^T \cdot \Delta\mathbf{x} < 0
$$
​	代入之前推导的 $\Delta\mathbf{x}_k$ 表达式：
$$
\Delta\mathbf{x}_k = \mathbf{x}_{k+1} - \mathbf{x}_k = -[\nabla^2f(\mathbf{x}_k)]^{-1}\nabla f(\mathbf{x}_k)
$$
​	为了保证迭代方向无误，需要满足在迭代范围附近的任意向量，以 Hesse 矩阵的逆为系数的二次型大于 0：
$$
\nabla f(\mathbf{x})^T \cdot [\nabla^2f(\mathbf{x})]^{-1}\nabla f(\mathbf{x}) > 0
$$
​	即：
$$
\nabla f^T \mathbf{H}^{-1}\nabla f > 0
$$
​	因此，为了保证优化算法的收敛性，一定需要保持 Hesse 矩阵正定，此时，其逆矩阵同时也是正定的。











