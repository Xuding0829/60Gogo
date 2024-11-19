# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
import binascii

KEYS = [0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01]
pointGroup = []

def printPlay(textStr, line, background):
    # 初始化16*16的点阵位置，每个汉字需要16*16=256个点来表示，需要32个字节才能显示一个汉字
    # 之所以32字节：256个点每个点是0或1，那么总共就是2的256次方，一个字节是2的8次方
    rect_list = [] * 16


    for i in range(16):
        rect_list.append([] * 16)

    for text in textStr:
        # 获取中文的gb2312编码，一个汉字是由2个字节编码组成
        gb2312 = text.encode('gb2312')
        # 将二进制编码数据转化为十六进制数据
        hex_str = binascii.b2a_hex(gb2312)
        # 将数据按unicode转化为字符串
        result = str(hex_str, encoding='utf-8')

        # 前两位对应汉字的第一个字节：区码，每一区记录94个字符
        area = eval('0x' + result[:2]) - 0xA0
        # 后两位对应汉字的第二个字节：位码，是汉字在其区的位置
        index = eval('0x' + result[2:]) - 0xA0
        # 汉字在HZK16中的绝对偏移位置，最后乘32是因为字库中的每个汉字字模都需要32字节
        offset = (94 * (area - 1) + (index - 1)) * 32

        font_rect = None

        # 读取HZK16汉字库文件
        with open("HZK16", "rb") as f:
            # 找到目标汉字的偏移位置
            f.seek(offset)
            # 从该字模数据中读取32字节数据
            font_rect = f.read(32)

        # font_rect的长度是32，此处相当于for k in range(16)
        for k in range(len(font_rect) // 2):
            # 每行数据
            row_list = rect_list[k]
            for j in range(2):
                for i in range(8):
                    asc = font_rect[k * 2 + j]
                    # 此处&为Python中的按位与运算符
                    flag = asc & KEYS[i]
                    # 数据规则获取字模中数据添加到16行每行中16个位置处每个位置
                    row_list.append(flag)
    point_y = 0
    pointCont = 0
    # 根据获取到的16*16点阵信息，打印到控制台
    for row in rect_list:
        point_x = 0
        for i in row:
            if i:
                # 前景字符（即用来表示汉字笔画的输出字符）
                print(line, end=' ')
                pointGroup.append(point_x+238)
                pointGroup.append(point_y+150)
                pointCont = pointCont + 1
            else:
                # 背景字符（即用来表示背景的输出字符）
                print(background, end=' ')
            point_x = point_x + 1
        point_y = point_y + 1
        print()

    print("点的数目：")
    print(pointCont)
    print("点集：")
    print(pointGroup)


# ----------------------------以上是库的引用和函数定义，下面是代码正文----------------------
# 允许用户自定义输入汉字短语
inpt = input("写你所想：")

# 自定义点阵字中笔画的符号
lineSign = '*'
# 备选方案
# lineSign = "0"

# 自定义点阵字的背景符号
backgroundSign = ' '
# 备选方案
# backgroundSign = "*"

# 调用之前定义好的函数，打印最终成果
printPlay(inpt, lineSign, backgroundSign)
