DATA_DIR=/data/share/zhanghaipeng/data/seq2seq/cnndm/test
MODEL_DIR=/data/share/zhanghaipeng/data/seq2seq/cnndm/test
CUDA=3
CUDA_VISIBLE_DEVICES=$CUDA python -u ../train.py \
	-data $DATA_DIR/data \
	-save_model $MODEL_DIR/cnndm \
	-layers 4 \
	-rnn_size 512 \
	-word_vec_size 512 \
	-max_grad_norm 0 \
	-optim adam \
	-encoder_type transformer \
	-decoder_type transformer \
	-position_encoding \
	-dropout 0\.2 \
	-param_init 0 \
	-warmup_steps 8000 \
	-learning_rate 2 \
	-decay_method noam \
	-label_smoothing 0.1 \
	-adam_beta2 0.998 \
	-batch_size 5 \
	-batch_type sents \
	-normalization tokens \
	-max_generator_batches 2 \
	-train_steps 200000 \
	-accum_count 4 \
	-share_embeddings \
	-copy_attn \
	-param_init_glorot \
	-world_size 1 \
	-gpu_ranks 0
