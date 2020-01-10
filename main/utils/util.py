import json
def get_data(data_path, src_path, tgt_path):
    src_writer = open(src_path, 'a')
    tgt_writer = open(tgt_path, 'a')
    with open(data_path, 'r') as reader:
        textlines = reader.readlines()
    test_num = 1000000
    for line in textlines[:1000000]:
        line = json.loads(line.strip())
        src = line['src']
        tgt = line['tgt']
        src_writer.write(src+'\n')
        tgt_writer.write(tgt+'\n')
    src_writer.close()
    tgt_writer.close()
if __name__ == '__main__':
    data_dir = '/nfs/users/zhanghaipeng/spellchecker/data_construction/data/xueyou_data/v2/dynamic_imb/s2s/'
    data_path = data_dir + 'train_2.json'
    src_path = data_dir + 'train_2.txt.src'
    tgt_path = data_dir + 'train_2.txt.tgt'
    get_data(data_path, src_path, tgt_path)
