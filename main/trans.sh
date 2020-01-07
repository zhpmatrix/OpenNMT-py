DATA_DIR=/data/share/zhanghaipeng/data/seq2seq/cnndm
MODEL_DIR=/data/share/zhanghaipeng/data/seq2seq/cnndm/model_old
STEP=40000
python ../translate.py \
	-gpu 0 \
	-batch_size 2 \
	-beam_size 3 \
	-model $MODEL_DIR/cnndm_step_$STEP.pt \
	-src $DATA_DIR/test.txt.src \
	-output $DATA_DIR/cnndm.out \
	-min_length 35 \
	-verbose \
	-stepwise_penalty \
	-coverage_penalty summary \
	-beta 5 \
	-length_penalty wu \
	-alpha 0.9 \
	-verbose \
	-block_ngram_repeat 3 \
	-ignore_when_blocking "." "</t>" "<t>"
