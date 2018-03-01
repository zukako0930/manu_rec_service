import os
import csv
import MeCab
mecab = MeCab.Tagger('-Owakati -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')

#データからとりあえず列を抽出してリストで返す
def fetch_data(input):
    ret = []
    with open(input) as f:
        reader = csv.reader(f)
        for row in reader:
            if row[37]=='85':
                ret.append(row[23])
    return ret
#バイトル原稿データから仕事内容の列のみ抽出
def fetch_data_ver1(input):
    ret =[]
    with open(input) as f:
        reader = csv.reader(f)
        for row in reader:
            ret.append(row[9])
    return ret
#不要な改行を全て除去
def remove_lf(list):
    for i in range(len(list)):
        hoge = list[i].replace('\n','')
        list[i] = hoge
#ファイル保存用
def write(list_of_sentence,path):
    if os.path.exists(path):
        pass
    else:
        with open(path,'w') as f:
            for sentence in list_of_sentence:
                f.writelines(sentence+'\n')
#登場回数に分けてソートして出力
def sort(list):
    from collections import Counter
    tmp = Counter(list)
    return tmp
#Counteでできた辞書型インスタンスをlistでうまく保存
def write_sort(dic,path):
    if os.path.exists(path):
        pass
    else:
        with open(path,'w') as f:
            for k,v in dic.most_common():
                f.writelines(k+','+str(v)+'\n')
#分かち書きを行いtxtで出力
def ana(list_of_sentence):
    tmp = []
    for i in range(len(list_of_sentence)):
        hoge = mecab.parse(list_of_sentence[i])
        tmp.append(hoge)
    with open('./data/posting_info_baitoru_devided1.txt', 'w') as f:
           f.writelines(tmp)
#辞書型でソートされているデータを分かち書きして出力
def ana_sort(dic,path):
    tmp = []
    num_tmp = []
    for k,v in dic.most_common():
        hoge = mecab.parse(k)
        tmp.append(hoge)
        num_tmp.append(str(v))
    with open(path, 'w') as f:
        for(sentence, frequency) in zip(tmp,num_tmp):
            f.writelines(sentence.replace('\n','')+'\n')
            #f.writelines(sentence.replace('\n','')+','+frequency+'\n')
#記号などを除去して分かち書きして出力
def extract_keyword(dic,path):
    mecab = MeCab.Tagger('-Ochasen -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')
    for k,v in dic.most_common():
        node = mecab.parseToNode(k)
        with open(path,'a') as f:
            while node:
                tmp = node.feature.split(',')[0]
                if tmp =='名詞'or tmp =='動詞':
                    f.write(node.surface+'  ')
                node = node.next
            #f.write(str(v)+'\n')
            f.write('\n')

if __name__=='__main__':
    data = fetch_data_ver1(os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_baitoru.csv')
    remove_lf(data)
    write(data,os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_baitoru.txt')
    sort_data = sort(data)
    write_sort(sort_data,os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_baitoru_sorted.txt')
    ana_sort(sort_data,os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_baitoru_sorted_devided.txt')
    extract_keyword(sort_data, os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_sorted_wakati_ver1.txt')
