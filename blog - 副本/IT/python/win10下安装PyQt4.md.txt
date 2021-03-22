python版本3.5.4，看了官方的安装教程太繁琐，可以直接网上下载[PyQt4‑4.11.4‑cp35‑cp35m‑win_amd64.whl]( https://www.lfd.uci.edu/~gohlke/pythonlibs/#pyqt4 )，具体版本根据个人实际情况来，python版本以及x系统位数都要对应上即可，下面以我的开发环境为例安装步骤如下： 
1、下载PyQt4‑4.11.4‑cp35‑cp35m‑win_amd64.whl后将其放到C:\Program Files\Python35\Scripts路径下； 
2、cmd 管理员身份运行，cd C:\Program Files\Python35\Scripts 
pip PyQt4‑4.11.4‑cp35‑cp35m‑win_amd64.whl 
3、安装完成后，新建测试程序验证一下，会弹出ui框：
```
from PyQt4.QtGui import *
import sys
a= QApplication(sys.argv)
w= QWidget()
w.resize(320, 240)
w.setWindowTitle("Hello World")
w.show()
sys.exit(a.exec_()) 
```
### qt  designer目录
C:\Python27\Lib\site-packages\PyQt4\designer.exe




### qt布局文件转成python文件
```
cd C:\Python27\Lib\site-packages\PyQt4\uic
python pyuic.py "ui文件路径" -o "py文件路径"
```

