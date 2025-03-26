# Allegro Manual

## 1. 操作手册

### 1.1. 搜索定位器件

> Setup -> User Preference Editor -> Ui -> Zoom

​	取消勾选 `no_zoom_to_object` 。

​	搜索前，点击 `Show_Element(F4)` ，一个灰色 `i` 图标。

### 1.2. Options 类及子类说明

​	在 Allegro 中放置元件的时候，需要指定当前类和子类。同样的，也可以通过限制当前类和子类来查看对应的元件。

#### 1.2.1. Analysis

​	这个类下面的子类都是废弃的（This subclass is no longer in use）。

#### 1.2.2. Anti Etch

​	无官方文档说明。

​	查资料，这层配合 keep in 区域，进行网络平面分隔。可以使一个平面分配指定网络，使不同的信号有不同的大面积电位参考平面。

#### 1.2.3. Board Geometry

​	板框层。

1. **Assembly_Detail**：装配层细节，可以放置装配要求的说明；
2. **Assembly_Notes**：装配层备注，放装配要求的文字说明，与 Assembly_Detail 类似；
3. **Both_Rooms**：在装配层所有层放置一个 Room，用来规定那些器件可以放置在这些 Room 中，配合 Package to Room 使用；
4. **Cutout**：官方无说明，查资料，用于在板框层内开窗使用；
5. **Design_Outline**：官方无说明，查资料，用于放置板外框。按 `F2` 时，缩放到 Design_Outline 画的封闭板框外形的大小来 view；
6. **Dimension**：放板框层的尺寸定义；
7. **Ncroute_Path**：官方无说明；
8. **Off_Grid_Area**：定义 grid 区域；
9. **Outline**：官方定义的板框层，查资料，不建议使用该层，公司仍使用盖层作为板框层；
10. **Place_Grid_Bottom**：放置底层格点；
11. **Place_Grid_Top**：放置顶层格点；
12. **Plating_Bar**：金属化的条，e.g. 金手指；
13. **Ravel**：官方无说明；
14. **Silkscreen_Bottom**：底层丝印；
15. **Silkscreen_Top**：顶层丝印；
16. **SolderMask_Bottom**：底层阻焊；
17. **SolderMask_Top**：顶层阻焊；
18. **Switch_Area_Bottom**：已经废弃；
19. **Tooling_Corners**：疑似与柔性电路板有关；
20. **Top_Room**：顶层 Room；
21. **Wb_Guide_Line**：定义 APD+ 中的焊盘边界。

#### 1.2.4. Boundary

​	无官方说明。

#### 1.2.5. Cavity

​	无官方说明。

#### 1.2.6. Component Value

​	用于纯手工布板，不适用原理图的场景。

1. **Assembly_Bottom**：组装底层，辅助手工在 PCB Editor 中输入元件值，如果从原理图引入的网表，这里没用；
2. **Assembly_Top**：组装顶层，其他同上；
3. **Display_Bottom**：显示底层，其他同上；
4. **Display_Top**：显示顶层，其他同上；
5. **Silkscreen_Bottom**：丝印底层，其他同上；
6. **Silkscreen_Top**：丝印顶层，其他同上。

#### 1.2.7. Constraint Ragion

​	官方无说明。限制区的意思。

#### 1.2.8. Device Type

​	用于在不同的 Sub-class 中显示设备类型。

#### 1.2.9. Drawing Format

​	用于画图纸信息。e.g. 说明用的图标，标题栏等。

1. **Outline**：放置设计表格或文档；
2. **Revision_Block**：放置版本之间的差异；
3. **Revesion_Data**：放置版本历史信息；
4. **Title_Block**：标题栏，对标原理图标题栏；
5. **Title_Data**：PCB 标题栏中的数据。e.g. 项目名称，板子名称，作者，日期，版本号等。

#### 1.2.10. Drc Error Class

​	用来选择 DRC 错误。子类见名知义。

#### 1.2.11. Etch

​	用于放置电气连线。

#### 1.2.12. Manufacturing

​	自动操作（由 TCL 脚本操作）的层，不建议手工编辑该层。

#### 1.2.13. Package_Geometry

​	PCB 封装所在层。

#### 1.2.14. Package_Keepin

​	PCB 封装可以放置的区域。

#### 1.2.15. Package_Keepout

​	PCB 封装不能放置的区域。

#### 1.2.16. Pin

​	无官方说明。

#### 1.2.17. Plan

​	无官方说明。

#### 1.2.18. Ref Des

​	用于显示元件位号。

#### 1.2.19. Rigid Flex

​	无官方说明。

#### 1.2.20. Route Keepin

​	无官方说明。允许布线区。

#### 1.2.21. Route Keepout

​	无官方说明。禁止布线区。

#### 1.2.22. Surface Finishes

​	无官方说明。

#### 1.2.23. Tolerance

​	公差层。

#### 1.2.24. User Part Number

​	部件号码层。e.g. 嘉立创商品编号，公司内部私有元件编号。

#### 1.2.25. Via Class

​	无官方说明。过孔类。

#### 1.2.26. Via Keepout

​	无官方说明。禁止放置过孔类。