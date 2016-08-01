#-*- coding: UTF-8 -*-
import re

IS_DEBUG = True
ENGLISH_DATA = "heroes_english.htm"
SCHINESE_DATA = "heroes_schinese.htm"

def display_table(table):
    if not IS_DEBUG:
        return
    for key in table:
        print key, table[key]

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

def extract_link_table(filename):
    fin = open(filename, 'r')
    content = fin.read()
    fin.close()

    result = re.findall(r'<a id="link_([a-z_]+)" class="heroPickerIconLink" href="(http://www.dota2.com/hero/[a-zA-Z_-]+/)">', content)
    table = {}
    for (sign, value) in result:
        table[sign] = value
    return table

def extract_hover_table(filename):
    fin = open(filename, 'r')
    content = fin.read()
    fin.close()

    result = re.findall(r'<img id="hover_([a-z_]+)" class="heroHoverLarge" style="display:none;" src="(http://cdn.dota2.com/apps/dota2/images/heroes/[a-z_]+_hphover.png[\?v=0-9]*)" />', content)
    table = {}
    for (sign, value) in result:
        table[sign] = value
    return table

def generate_full_table(hover_table):
    full_table = {}
    for key in hover_table:
        full_table[key] = hover_table[key].replace("hphover", "full")
    return full_table

if __name__ == "__main__":
    ename_table = extract_name_table(ENGLISH_DATA)
    display_table(ename_table)

    sname_table = extract_name_table(SCHINESE_DATA)
    display_table(sname_table)

    link_table = extract_link_table(ENGLISH_DATA)
    display_table(link_table)

    hover_table = extract_hover_table(ENGLISH_DATA)
    display_table(hover_table)

    full_table = generate_full_table(hover_table)
    display_table(full_table)
