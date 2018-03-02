import os
import csv
import itertools
import pandas as pd
from gensim import corpora, models, similarities
import gensim
#import MeCab
#mecab = MeCab.Tagger('-Owakati -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')
data_path = os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_sorted_wakati_ver1.txt'
dic_path = os.path.dirname(os.path.abspath(__file__))+'/data/dictionary.dict'
cor_path = os.path.dirname(os.path.abspath(__file__))+'/data/cor.mm'
lda = gensim.models.LdaModel.load(os.path.dirname(os.path.abspath(__file__))+'/data/300/lda300.model')
csv_path = os.path.dirname(os.path.abspath(__file__))+'/data/300/predict_300.csv'
data_path = os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_baitoru_sorted.txt'
def input_req(input_list):
    with open('search_words.csv','r') as f:
        reader = csv.reader(f)
        for row in reader:
            for word in row:
                input_list.append(word)
    # tmp = input()
    # if tmp:
    #     input_list.append(tmp)
    #     input_req(input_list)
    # else:
    #     pass
def load(dic_path, cor_path):
    dic = corpora.Dictionary.load_from_text(dic_path)
    cor = corpora.MmCorpus(cor_path)
    return dic,cor
#単語を入力としてモデルのトピックのリストを返す
def get_topic(list_of_word, dic, cor, model):
    res = []
    bow_input = dic.doc2bow(list_of_word)
    lda_vec = model[bow_input]
    #lda_index = similarities.MatrixSimilarity(model[bow_input])
    #lda_sims = model[lda_vec]
    #lda_sims = [(4,0.8),(10,0.15),(12,0.05)]のような形
    for i in lda_vec:
        res.append(i[0])
    return res
#トピックから文章のidを複数返す
def get_sentence(topic_list, csv_path, data_path):
    ans = []
    df = pd.read_csv(csv_path, header=None)
    for i in topic_list:
        tmp = df[[i]]
        res = tmp.sort_values([i], ascending=False)[0:5].index[0:5]
        res = list(res)
        ans.append(res)
    ans = list(itertools.chain(*ans))
    ans = sorted(ans)
    i = 0
    with open(data_path,'r') as f:
        for line in f:
            if i in ans:
                print(line)
            i = i+1


if __name__=='__main__':
    #x = ['パン','接客','初心者']
    x = []
    y = []
    z = []
    input_req(x)
    print(x)
    #print(type(x))
    dic, cor = load(dic_path, cor_path)
    y = get_topic(x, dic, cor, lda)
    print(y)
    get_sentence(y, csv_path, data_path)
