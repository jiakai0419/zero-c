#-*- coding: UTF-8 -*-
import re

IS_DEBUG = True
ENGLISH_DATA = "heroes_english.htm"
SCHINESE_DATA = "heroes_schinese.htm"

def extract_name_table(filename):
    flag = False
    buf = []
    fin = open(filename, 'r')
    for line in fin:
        if flag:
            buf.append(line)
        else:
            if "HERO NAME" in line or "英雄名称" in line:
                flag = True
    fin.close()
    
    result = re.findall(r'<option value="([a-z_]+)">([a-zA-Z\x80-\xff- \']+)</option>', "".join(buf))
    table = {}
    for (sign, value) in result:
        table[sign] = value
    return table

def display_name_table(table):
    if not IS_DEBUG:
        return
    for key in table:
        print key, table[key]

if __name__ == '__main__':
    ename_table = extract_name_table(ENGLISH_DATA)
    display_name_table(ename_table)

    sname_table = extract_name_table(SCHINESE_DATA)
    display_name_table(sname_table)
