# Qt中Linux与Windows跨平台时路径问题解决方法

不同系统对路径的解析不同，网上的解决方法一般是对QString使用contains函数，检查路径中的“\”和“/”符号，如：

```
QString path = "C:/testA\\testB\testC.txt";  
QString tmpPath;  
if(path.contains("\\"))  
{  
     tmpPath = path.replace("\\","/",Qt::CaseInsensitive);  
}  
if(tmpPath .contains("\\"))  
{  
     tmpPath = tmpPath .replace("<a target="_blank">\\</a>","/",Qt::CaseInsensitive);  
}  
```

但是Qt中有更为简单的方法：

```
QString path ;  
  
path = "E:/file1/file2/file3.txt";  
  
path = QDir::toNativeSeparators(path);  
  
//这样就转化为本地格式。可以直接使用了。 
```

