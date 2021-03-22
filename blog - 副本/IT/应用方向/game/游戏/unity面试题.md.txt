### 脚本的生命周期阶段
Awake()脚本组件载入时（调用一次）,一般用于实现单例模式
OnEnable()在游戏对象可以调用时调用
Start()第一个Update发生之前（调用一次）
Update()大部分游戏行为代码被执行的地方，除了物理代码
FixedUpdate()固定时间调用，常用于物理相关的计算，比如对RigidBody的操作
LaterUpdate()每帧Update调用之后
OnGui()绘制GUI时调用
OnDisable()当对象设置为不可用时
OnDestroy()组件销毁时调用
### 在物体发生碰撞的整个过程中
OnCollisionEnter(进入碰撞)
OnCollisionStay (逗留碰撞)
OnCollisionExit(当退出碰撞)
### mipmap问题
mipmap是种LOD(level of detail)技术，贴图资源使用Mipmap后，内存会生成多个大小不同的贴图，会根据摄像机距离的远近，选择使用不同精度的贴图
缺点：会占用内存
优点：加快渲染速度
### volatile关键字
volatile关键字会告诉编译器声明的变量不需要优化，使用volatile声明的变量不使用寄存器，要老老实实的从内存中读，和往内存中写
### 光照模型
OpenGL的光照使用了简化的模型并基于对现实的估计来进行模拟
经典的光照模型有Lambert模型，Phong模型，Blinn-Phong模型，全局光照模型
冯氏光照模型的主要结构由3个元素组成：环境(Ambient)、漫反射(Diffuse)和镜面(Specular)光照
* 环境光照(Ambient Lighting)：即使在黑暗的情况下，世界上也仍然有一些光亮(月亮、一个来自远处的光)，所以物体永远不会是完全黑暗的。我们使用环境光照来模拟这种情况，也就是无论如何永远都给物体一些颜色。
* 漫反射光照(Diffuse Lighting)：模拟一个发光物对物体的方向性影响(Directional Impact)。它是冯氏光照模型最显著的组成部分。面向光源的一面比其他面会更亮。
* 镜面光照(Specular Lighting)：模拟有光泽物体上面出现的亮点。镜面光照的颜色，相比于物体的颜色更倾向于光的颜色。
### Unity中的光源都有哪些
Directional Light  模拟自然光
Point Light        模拟电灯泡的照射效果
Spot Light       模拟聚光灯照射效果
Area Light       区域光在“实时光照”模式下是无效的，仅在“烘焙光照”模式下有用。
### 向量点乘，叉乘和归一化的意义
点乘
点乘等于向量大小与向量夹角的cos值的积。点乘结果越大两向量越近
叉乘
1.叉乘的结果是垂直于两个向量所在平面的向量
2.叉乘的模可以计算两向量围成的平行四边形面积
3.叉乘还可以判断两向量顺时针和逆时针方向
归一化
标准向量等于向量除以它的模，意义是简化操作只考虑向量的方向，不考虑大小
### MeshRender的material和shareMaterial的区别
从效率上sharedMaterial要高点，它是共享材质，无论如何操作材质的属性（如更换颜色或者更换shader），内存中只会占用一份
要是用material的话，每次更换属性的时候Unity就会自动new一份新的material作用于它
### C#的ref参数和out参数的区别
1.ref和out关键字使参数按引用传递，方法定义和使用的时候都需要加ref和out关键字
2.ref的参数必须先初始化
3.out必须在方法中对其赋值
4.out适合在需要return多个返回值的地方，而ref则用在需要被调用的方法修改调用者的引用的时候

