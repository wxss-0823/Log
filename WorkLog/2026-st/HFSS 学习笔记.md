# HFSS 学习笔记

## Mesh

​	自定义







## Field Overlays

### Field

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

### Mesh

​	用于在指定面或者指定体内，画出最后一次计算过程中收敛的网格。
