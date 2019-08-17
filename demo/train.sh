ROOT_DIR=..
CUDA=0,1
CUDA_VISIBLE_DEVICES=$CUDA python $ROOT_DIR/train.py \
	-world_size 1 \
	-gpu_ranks 0 \
	-train_step 500 \
	-batch_size 32 \
	-data $ROOT_DIR/data/demo/demo \
	-save_model $ROOT_DIR/data/demo/demo_model
