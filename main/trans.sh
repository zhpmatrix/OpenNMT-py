DIR=/data/zhanghaipeng/seq2seq/s2s
DATA_DIR=$DIR/data
MODEL_DIR=$DIR/model
CUDA=3
STEP=40000
CUDA_VISIBLE_DEVICES=$CUDA python -u ../onmt/bin/translate.py \
	-batch_size 256 \
	-src $DIR/test.txt.src \
	-model $MODEL_DIR/s2s_step_$STEP.pt \
	-output $MODEL_DIR/predictions.txt \
	-replace_unk \
	-verbose
