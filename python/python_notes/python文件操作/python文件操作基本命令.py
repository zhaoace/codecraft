
f = open("HelloAndy.txt","w")
f.fileno()      #文件的描述符，整数，用在os模块等底层操作中
f.close()

f = open("HelloAndy.txt","r+")
f.fileno()      
f.tell()        #现在的游标位置
f.write('''
filename = raw_input('Enter file name: ')
    fobj = open(filename, 'w')
    while True:
        aLine = raw_input("Enter a line ('.' to quit): ")
        if aLine != ".":
            fobj.write('%s%s' % (aLine, os.linesep)
        else:
            break
    fobj.close()
''')

f.truncate(49)  #文件从开头截取到siz=49的地方
f.tell()        #现在的游标位置
f.truncate()    #定义到开头截取到现在的游标处
f.seek(0)       #游标定义到文件开头
f.read()        #读取所有的文件内容 ,游标到最后
f.write("""
Type again!
filename = raw_input('Enter file name: ')
    fobj = open(filename, 'w')
    while True:
        aLine = raw_input("Enter a line ('.' to quit): ")
        if aLine != ".":
            fobj.write('%s%s' % (aLine, os.linesep)
        else:
            break
    fobj.close()

""")
f.flush()       #将缓存中的内容立即输出到文件中
f.close()


file =  open("HelloAndy.txt","r+")

file.closed              #True 表示文件已经被关闭, 否则为 False
file.encoding            # 文件所使用的编码 - 当 Unicode 字符串被写入数据时, 它们将自动使用 file.encoding 转换为字节字符串; 若file.encoding 为 None 时使用系统默认编码
file.mode                #文件打开时使用的访问模式
file.name                #文件名
file.newlines            #未读取到行分隔符时为 None , 只有一种行分隔符时为一个字符串, 当文件有多种类型的行结束符时，则为一个包含所有当前所遇到的行结束符的列表



#有助于跨平台开发的 os 模块属性
import os
os.linesep               #用于在文件中分隔行的字符串
os.sep                   # 用来分隔文件路径名的字符串
os.pathsep               # 用于分隔文件路径的字符串
os.curdir                # 当前工作目录的字符串名称
os.pardir                #(当前工作目录的)父目录字符串名称