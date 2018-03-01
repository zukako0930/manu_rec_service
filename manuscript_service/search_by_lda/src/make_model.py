import os
from gensim import corpora, models, similarities
import gensim
import MeCab
import csv
mecab = MeCab.Tagger('-Owakati -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')

def fetch_txt(path):
    tmp = []
    res = []
    with open(path,'r') as f:
        txt = f.read()
    tmp = txt.splitlines(True)
    for sentence in tmp:
        tmp1 = []
        token = sentence.split()
        for a in token:
            tmp1.append(a)
        res.append(tmp1)
    return res

def save(dic_path,cor_path,input_txt,below,above):
    if os.path.exists(dic_path) and os.path.exists(cor_path):
        pass
    else:
        dic = corpora.Dictionary(input_txt)
        dic.filter_extremes(below, above)
        dic.save_as_text(dic_path)
        corpus = [dic.doc2bow(text) for text in input_txt]
        corpora.MmCorpus.serialize(cor_path, corpus)

def load(dic_path, cor_path):
    dic = corpora.Dictionary.load_from_text(dic_path)
    cor = corpora.MmCorpus(cor_path)
    return dic,cor

def make_model(dictionary, corpus, model_path, num_of_topics):
    if os.path.exists(model_path):
        pass
    else:
        model = gensim.models.ldamodel.LdaModel(corpus, num_of_topics, id2word=dictionary, random_state=1)
        model.save(model_path)

def save_predict_every_data(dictionary, model, i, input_path, output_path):
    if not os.path.exists(output_path):
        for sentence in input_path:
            vec = dictionary.doc2bow(sentence)
            predict = model[vec]
            #predict = sorted(tmp, key=lambda x:x[1])
            row = [0 for _ in range(i)]
            for data in predict:
                row[data[0]] = data[1]
            with open(output_path, 'a') as f:
                writer = csv.writer(f)
                writer.writerow(row)
    else:
        sen = input_path[0]
        print(sen)


if __name__ == '__main__':
    data_path = os.path.dirname(os.path.abspath(__file__))+'/data/posting_info_sorted_wakati_ver1.txt'
    dic_path = os.path.dirname(os.path.abspath(__file__))+'/data/dictionary.dict'
    cor_path = os.path.dirname(os.path.abspath(__file__))+'/data/cor.mm'
    all_list = [50,100,150,200,300,500]
    lda = gensim.models.LdaModel.load('./data/300/lda300.model')

    txt_list = fetch_txt(data_path)
    save(dic_path, cor_path, txt_list, 3, 0.5)
    dic, cor = load(dic_path, cor_path)
    for i in all_list:
        lda_path = os.path.dirname(os.path.abspath(__file__))+'/data/'+str(i)+'/lda'+str(i)+'.model'
        Every_predict = os.path.dirname(os.path.abspath(__file__))+'/data/'+str(i)+'/predict_'+str(i)+'.csv'
        #make_model(dic, cor, lda_path, i)
        lda = gensim.models.LdaModel.load(lda_path)
        save_predict_every_data(dic, lda, i, txt_list, Every_predict)
