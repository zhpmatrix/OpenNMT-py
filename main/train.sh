DIR=/nfs/users/zhanghaipeng/spellchecker/data_construction/data/xueyou_data/v2/dynamic_imb/s2s
DATA_DIR=$DIR/data
MODEL_DIR=$DIR/model
ROOT_DIR=..
CUDA=2
CUDA_VISIBLE_DEVICES=$CUDA python -u ../onmt/bin/train.py \
	-world_size 1 \
	-gpu_ranks 0 \
	-train_step 200000 \
	-batch_size 4096 \
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
	-batch_type tokens \
	-normalization tokens \
	-max_generator_batches 2 \
	-accum_count 2 \
	-share_embeddings \
	-copy_attn \
