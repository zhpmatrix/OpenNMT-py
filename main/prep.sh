DATA_DIR=/data/zhanghaipeng/seq2seq/s2s
TRAIN_NAME=train_2
python ../onmt/bin/preprocess.py \
	-train_src $DATA_DIR/$TRAIN_NAME.txt.src \
	-train_tgt $DATA_DIR/$TRAIN_NAME.txt.tgt \
	-valid_src $DATA_DIR/val.txt.src \
	-valid_tgt $DATA_DIR/val.txt.tgt \
	-save_data $DATA_DIR/data \
	-src_seq_length 60 \
	-tgt_seq_length 60 \
	-src_seq_length_trunc 100 \
	-tgt_seq_length_trunc 100 \
	-dynamic_dict \
	-share_vocab \
	-shard_size 200000
