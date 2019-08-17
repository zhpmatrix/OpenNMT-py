ROOT_DIR=..

python $ROOT_DIR/preprocess.py \
       	-train_src $ROOT_DIR/data/src-train.txt \
	-train_tgt $ROOT_DIR/data/tgt-train.txt \
	-valid_src $ROOT_DIR/data/src-val.txt \
	-valid_tgt $ROOT_DIR/data/tgt-val.txt \
	-save_data $ROOT_DIR/data/demo/demo
