#bash download.sh
source activate tensorflow
#pip install -U pip
#pip install -r requirements.txt
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/
#python analyzer.py
#python build.py
python main.py \
  --model ConvVAE \
  --trainer VAETrainer \
  --architecture architecture-vae-vcc2016.json
python convert.py \
  --src SF1 \
  --trg TM3 \
  --model ConvVAE \
  --checkpoint logdir/train/[timestamp]/model.ckpt-[newest-ckpt-id] \
  --file_pattern "./dataset/vcc2016/bin/Testing Set/{}/*.bin"
echo "Please find your results in newest folder of `./logdir/output/"
