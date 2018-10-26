# ID_Number_Recognition_Test
身份证号码识别  
# 本项目主要实现的是对身份证图像中的身份证号码进行识别输出，有三种程序来实现  
# 1）matlab_source中的manual_position_recognition.m，它是一个matlab程序，它的主要实现过程如下：
[1]获取样本图像（0~9、x）  
[2]图像预处理（灰度化-二值化）  
[3]特征提取（空间分布特征、结构特征）  
[4]数字特征匹配  
[5]扫描得到待识别身份证图像  
[6]图像预处理（灰度化-二值化）  
[7]提取身份证号码区域数字  
[8]特征提取（空间分布特征、结构特征）  
[9]依次提取数字特征与样本数字特征对比匹配  
[10]计算每个数字的匹配度，将匹配度最高的数字作为识别结果输出  
# 2）manual_position_recognition.ipynb，它是一个python程序，需要用到Jupyter工具打开和运行，它的主要实现过程如下：
[1]读取身份证图像  
[2]将身份证号码区域图像做膨胀处理  
[3]将膨胀后的图像做灰度化和二值化处理  
[4]去除身份证号码区域中的干扰像素点  
[5]对身份证号码区域调用pytesseract识别方法  
[6]输出识别出的号码  
# 3）auto_position_recognition.ipynb，它是一个python程序，需要用到Jupyter工具打开和运行，它的主要实现过程如下：
[1]利用opencv库中的函数读取身份证图像  
[2]将读取的图像转化为数字矩阵便于后续处理  
[3]利用身份证号码区域的矩阵特征查找身份证号码区域  
[4]将身份证号码区域单独提取出来  
[5]将身份证号码区域转化为图像类型  
[6]]对身份证号码区域调用pytesseract识别方法  
[7]输出识别出的号码  
# 4）项目所需开发环境及库
manual_position_recognition.m主要用的是win7x64 Matlab R2016a  
manual_position_recognition.ipynb主要用的是win7x64 Jupyter Numpy PIL pytesseract matplotlib  
auto_position_recognition.ipynb主要用的是win7x64 Jupyter Numpy PIL pytesseract matplotlib cv2  
# 5）注意事项
前两个程序主要注重图像识别这一块，而对于身份证号码区域的定位是需要手动计算的，  
如样本图像的分辨率为366*233，经计算的号码区域为（130,190,328,210）  
后两个程序都用到了pytesseract这个库，但若要真正使用该库，需要同时在系统中安装Tesseract-Ocr包，详见https://www.cnblogs.com/jianqingwang/p/6978724.html  
同时还要设置D:\ProgramData\Anaconda3\Lib\site-packages\pytesseract\pytesseract.py文件中的  
# tesseract_cmd = 'tesseract'为  
tesseract_cmd = 'C:/Program Files (x86)/Tesseract-OCR/tesseract.exe'  
对中文身份证的识别最好在image_to_string方法的第二个参数位置指定lang='chi_sim'。否则teseract库很容易报错
