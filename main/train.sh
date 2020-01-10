DIR=/data/zhanghaipeng/seq2seq/s2s
DATA_DIR=$DIR/data
MODEL_DIR=$DIR/model
LOG_DIR=$DIR/logs
ROOT_DIR=..
CUDA=0,1,2,3
CUDA_VISIBLE_DEVICES=$CUDA python -u ../onmt/bin/train.py \
	-world_size 4 \
	-gpu_ranks 0 1 2 3\
	-train_step 200000 \
	-batch_size 4096 \
	-batch_type tokens \
	-max_generator_batches 2 \
	-normalization tokens \
	-valid_steps 10000 \
	--save_checkpoint_steps 10000 \
	-data $DATA_DIR \
	-save_model $MODEL_DIR/s2s \
	-layers 6 \
	-rnn_size 512 \
	-word_vec_size 512 \
	-transformer_ff 2048 \
	-heads 8 \
	-max_grad_norm 0 \
	-encoder_type transformer \
	-decoder_type transformer \
	-position_encoding \
	-dropout 0\.1 \
	-param_init 0 \
	-param_init_glorot \
	-warmup_steps 8000 \
	-learning_rate 2 \
	-decay_method noam \
	-label_smoothing 0.1 \
	-optim adam \
	-adam_beta2 0.998 \
	-accum_count 2 \
	-share_embeddings \
	-tensorboard \
	-tensorboard_log_dir $LOG_DIR
