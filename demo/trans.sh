ROOT_DIR=..
CUDA=0,1
STEP=500
CUDA_VISIBLE_DEVICES=$CUDA python $ROOT_DIR/translate.py \
	-gpu 1 \
	-batch_size 32 \
	-src $ROOT_DIR/data/src-test.txt \
	-model $ROOT_DIR/data/demo/demo_model_step_$STEP.pt \
	-output $ROOT_DIR/data/demo/predictions.txt \
	-replace_unk \
	-verbose
