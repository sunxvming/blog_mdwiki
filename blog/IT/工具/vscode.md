查看帮助：F1, 可以用来查看各种快捷键


### 快捷键
快捷键设置

右上角的红圈可以打开json的配置




头文件源文件切换 alt+o
ctrl + F4    关闭标签
新建                 Ctrl + N
查找                 ctrl + f  Ctrl+Shift +f
替换                 ctrl + h  Ctrl+Shift +h
注释                 Ctrl + / 


删除一行             Ctrl+ Shift +k 
删至行首             Ctrl+K Backspace
删至行尾             Ctrl+KK


移到上一个光标处    alt + 左箭头
移到下一个光标处    alt + 右箭头
光标插入上一行      ctrl shift enter
光标插入下一行      ctrl enter
行上移              alt 上
行下移              alt 下
按括号移动光标


选单词                双击
选本行                三击
Ctrl + Shift + ←/→    进行逐词选择
Shift-上下箭头        按行选中
竖向多行选择          鼠标中键


改为大写            Ctrl+K+U
改为小写            Ctrl+K+L 
折叠所有            ^k 1
展开所有            ^k J


esc                关闭（隐藏）搜索栏
设置书签        todo


ctrl +`  显示console




### 设置
保存时去掉尾部空格
tab替换四个空格
主题
sublime mariana   浅黑色的主题
Tiny Light   一款还原Hbuilder“绿柔”主题的vs code主题




### 插件
* Alignment   按等号对齐   alt + = 
* Markdown    似乎是自带的
* ExpandRegion   扩展选区的    ctrl + w    ctrl + shift + w
* Clipboard-history      Ctrl+Shift+V    复制的历史记录




### python
安装python插件，在插件中搜索python，安装星最多的。
按照插件中的说明，设置python的开发环境。






### 配置文件
配置文件位置：.vscode
c++的配置：c_cpp_properties.json
文档：https://code.visualstudio.com/docs/cpp/config-mingw
```
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [
                "${workspaceFolder}/**",
                "${workspaceFolder}/../llvm-6.0.0.src/include/**",
                "${workspaceFolder}/../eosio.cdt/libraries/**"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "_UNICODE",
                "WAVM_API="
            ],
            "compilerPath": "C:/mingw-w64/mingw32/bin/g++.exe",
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "gcc-x64"
        }
    ],
    "version": 4
}
```



