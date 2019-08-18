DATA_DIR=/data/share/zhanghaipeng/data/seq2seq/cnndm
ROUGE_DIR=../rouge-baselines
python $ROUGE_DIR/baseline.py -s $DATA_DIR/cnndm.out -t $DATA_DIR/test/test.txt.tgt.tagged -m sent_tag_verbatim -r

