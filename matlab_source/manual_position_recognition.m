clear
%读入样本数字图像并二值化
RGB=im2double(imread('e:\yangbenshuzi.jpg'));
[height,width,n]=size(RGB);
BW=zeros(height,width);
for i=1:height
for j=1:width
r=RGB(i,j,1);
g=RGB(i,j,2);
b=RGB(i,j,3);
if(0.299*r+0.587*g+0.114*b<0.5)
   BW(i,j)=1;
else
   BW(i,j)=0;
end
end
end
%预处理并统计各样本数字的分布特征
width=width/10;
N=zeros(10,5);
digital=zeros(10,10);
E=zeros(1,10);
for k=0:9
A=BW(:,1+k*width:width+k*width);
B=[];
for i=1:width
a=A(:,i);
if sum(a)~=0
   B=[B a];
end
end
Sample=[];
for j=1:height
b=B(j,:);
if sum(b)~=0
   Sample=[Sample;b];
end
end
E(k+1)=bweuler(Sample,8);
%计算各样本的欧拉数
[m,n]=size(Sample);
for i=1:m
for j=1:n
if Sample(i,j)==1
N(k+1,1)=N(k+1,1)+1; %总白色点数
digital(k+1,1)=digital(k+1,1)+i; %横坐标和
digital(k+1,2)=digital(k+1,2)+j; %纵坐标和
if i<m/2
N(k+1,2)=N(k+1,2)+1;
%上半部分白色点数
digital(k+1,3)=digital(k+1,3)+i;
%上半部分横坐标和
digital(k+1,4)=digital(k+1,4)+j;
%上半部分纵坐标和
end
if i>m/2
N(k+1,3)=N(k+1,3)+1;
%下半部分白色点数
digital(k+1,5)=digital(k+1,5)+i;
%下半部分横坐标和
digital(k+1,6)=digital(k+1,6)+j;
%下半部分纵坐标和
end
if j<n/2
N(k+1,4)=N(k+1,4)+1;
%左半部分白色点数
digital(k+1,7)=digital(k+1,7)+i;
%左半部分横坐标和
digital(k+1,8)=digital(k+1,8)+j;
%左半部分纵坐标和
end
if j>n/2
N(k+1,5)=N(k+1,5)+1;
%右半部分白色点数
digital(k+1,9)=digital(k+1,9)+i;
%右半部分横坐标和
digital(k+1,10)=digital(k+1,10)+j;
%右半部分纵坐标和
end
end
end
end
digital(k+1,1)=digital(k+1,1)/N(k+1,1);
%整体质心横坐标
digital(k+1,2)=digital(k+1,2)/N(k+1,1);
%整体质心纵坐标
digital(k+1,3)=digital(k+1,3)/N(k+1,2);
%上半部分质心横坐标
digital(k+1,4)=digital(k+1,4)/N(k+1,2);
%上半部分质心纵坐标
digital(k+1,5)=digital(k+1,5)/N(k+1,3);
%下半部分质心横坐标
digital(k+1,6)=digital(k+1,6)/N(k+1,3);
%下半部分质心纵坐标
digital(k+1,7)=digital(k+1,7)/N(k+1,4);
%左半部分质心横坐标
digital(k+1,8)=digital(k+1,8)/N(k+1,4);
%左半部分质心纵坐标
digital(k+1,9)=digital(k+1,9)/N(k+1,5);
%右半部分质心横坐标
digital(k+1,10)=digital(k+1,10)/N(k+1,5);
%右半部分质心纵坐标
end
%获取身份证号码并进行二值化
I=im2double(imread('e:\yangzheng.jpg'));
figure,imshow(I);
x1=130;x2=130+11;
y1=190;y2=210;
IDRGB=I(y1:y2,x1:x2,:,:,:);
for i=1:17
    x1=130+11*i;
    x2=130+11*(i+1);
    C=I(y1:y2,x1:x2,:,:,:);
    IDRGB=[IDRGB C];
end
[IDheight,IDwidth,k]=size(IDRGB);
IDBW=zeros(IDheight,IDwidth);
for i=1:IDheight
    for j=1:IDwidth
        r=IDRGB(i,j,1);
        g=IDRGB(i,j,2);
        b=IDRGB(i,j,3);
        if(0.299*r+0.587*g+0.114*b<0.5)
          IDBW(i,j)=1;
        else
          IDBW(i,j)=0;
        end
    end
end
%预处理并统计目标数字对象的分布特征
IDwidth=IDwidth/18;
obj=zeros(18,10);
objN=zeros(18,5);
objE=zeros(1,18);
for k=1:18
IDA=IDBW(:,1+(k-1)*IDwidth:k*IDwidth);
  IDB=[];
  for i=1:IDwidth
      IDa=IDA(:,i);
      if sum(IDa)~=0
          IDB=[IDB IDa];
      end
  end
  Object=[];
  for j=1:IDheight
      IDb=IDB(j,:);
      if sum(IDb)~=0
          Object=[Object;IDb];
      end
  end
  objE(k)=bweuler(Object,8); %欧拉数
  [m,n]=size(Object);
  for i=1:m
  for j=1:n
  if Object(i,j)==1
  objN(k,1)=objN(k,1)+1;
  obj(k,1)=obj(k,1)+i;
  obj(k,2)=obj(k,2)+j;
  if i<m/2
  objN(k,2)=objN(k,2)+1;
  obj(k,3)=obj(k,3)+i;
  obj(k,4)=obj(k,4)+j;
  end
  if i>m/2
  objN(k,3)=objN(k,3)+1;
  obj(k,5)=obj(k,5)+i;
  obj(k,6)=obj(k,6)+j;
  end
  if j<n/2
  objN(k,4)=objN(k,4)+1;
  obj(k,7)=obj(k,7)+i;
  obj(k,8)=obj(k,8)+j;
  end
  if j>n/2
  objN(k,5)=objN(k,5)+1;
  obj(k,9)=obj(k,9)+i;
  obj(k,10)=obj(k,10)+j;
  end
  end
  end
  end
  obj(k,1)=obj(k,1)/objN(k,1);
  obj(k,2)=obj(k,2)/objN(k,1);
  obj(k,3)=obj(k,3)/objN(k,2);
  obj(k,4)=obj(k,4)/objN(k,2);
  obj(k,5)=obj(k,5)/objN(k,3);
  obj(k,6)=obj(k,6)/objN(k,3);
  obj(k,7)=obj(k,7)/objN(k,4);
  obj(k,8)=obj(k,8)/objN(k,4);
  obj(k,9)=obj(k,9)/objN(k,5);
  obj(k,10)=obj(k,10)/objN(k,5);
end
%分类识别
String='0123456789';
IDCardNO='';
for k=1:18
R=0.0;
j=0;
x=obj(k,:);
for i=0:9
y=digital(i+1,:);
r=sum(x.*y)/sqrt(sum(x.*x)*sum(y.*y));
%相似系数
if r>R&objE(k)==E(i+1)%分类识别准则
   R=r;
   j=i;
end
end
IDCardNO=strcat(IDCardNO,String(j+1));
end
disp(IDCardNO); %显示识别结果