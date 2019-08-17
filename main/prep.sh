DATA_DIR=/data/share/zhanghaipeng/data/seq2seq/cnndm

python ../preprocess.py \
	-train_src $DATA_DIR/train.txt.src \
	-train_tgt $DATA_DIR/train.txt.tgt.tagged\
	-valid_src $DATA_DIR/val.txt.src \
	-valid_tgt $DATA_DIR/val.txt.tgt.tagged \
	-save_data $DATA_DIR/data \
	-src_seq_length 10000 \
	-tgt_seq_length 10000 \
	-src_seq_length_trunc 400 \
	-tgt_seq_length_trunc 100 \
	-dynamic_dict \
	-share_vocab \
	-shard_size 100000
