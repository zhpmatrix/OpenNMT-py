import json
import jieba
import random
import pandas as pd
from tqdm import tqdm
random.seed(666)

def s2s_char(example):
    chars = [char for char in example['tgt']]
    # 少字
    delete_idx = random.sample([i for i in range(len(chars))], 1)
    # 多字
    add_idx = random.sample([i for i in range(len(chars))], 1)
    prob = random.random()
    if prob < 0.50:
        chars.remove(chars[delete_idx[0]])
    else:
        chars.insert(add_idx[0],chars[add_idx[0]])
    example['src'] = ''.join(chars)
    return example

def s2s_gendata(data_path, save_path):
    writer = open(save_path, 'w')
    with open(data_path, 'r') as reader:
        textlines = reader.readlines()
    pos_num = 0
    neg_num = 0
    for i,line in enumerate(textlines):
        example = json.loads(line)
        if example['src'] != example['tgt']:
                example = s2s_char(example)
        if example['src'] == example['tgt']:
            neg_num += 1
        else:
            pos_num += 1
        print(i,neg_num, pos_num)
        writer.write(json.dumps(example, ensure_ascii=False)+'\n')
    writer.close()

if __name__ == '__main__':
    data_dir = '/nfs/users/zhanghaipeng/spellchecker/data_construction/data/xueyou_data/v2/dynamic_imb/'
    filename = 'test.json'
    data_path = data_dir + filename
    save_path = data_dir + 's2s/'+filename
    s2s_gendata(data_path,save_path)
