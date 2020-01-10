from tensorboard.backend.event_processing import event_accumulator
root_dir = '/data/zhanghaipeng/seq2seq/s2s/logs/'
file_name = 'Jan-10_14-51-08/'
log_path = 'events.out.tfevents.1573803254.hpc4.ipa.aidigger.com'
ea=event_accumulator.EventAccumulator(root_dir+file_name+log_path)
ea.Reload()
print(ea.scalars.Keys())

xents=ea.scalars.Items('valid/xent')
ppls=ea.scalars.Items('valid/ppl')
accs=ea.scalars.Items('valid/accuracy')
for xent, ppl, acc in zip(xents,ppls,accs):
    if xent.step >= 10000:
        print(xent.step, xnet.value, ppl.value, acc.value)
