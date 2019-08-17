import json
import copy
from tqdm import tqdm
from pprint import pprint
from pyltp import SentenceSplitter

def string_filter(string):
    return list(SentenceSplitter.split(string))    

def get_data(data_dir='/data/share/zhanghaipeng/data/seq2seq/cars_article_headline/', data_type='test'):
    src_writer = open(data_dir+'src-'+data_type+'.txt', 'w')
    tgt_writer = open(data_dir+'tgt-'+data_type+'.txt', 'w')
    with open(data_dir+data_type+'.json', 'r') as reader:
        for i,line in enumerate(reader):
            example = json.loads(line)
            content = example['content']
            headline = example['headline']
            content_list = string_filter(content)
            src_writer.write(content+'\n')
            tgt_writer.write(headline+'\n')
    src_writer.close()
    tgt_writer.close()

if __name__ == '__main__':
    get_data()
