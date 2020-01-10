from tensorboard.backend.event_processing import event_accumulator
root_dir = '../runs/4/'
log_path = 'events.out.tfevents.1573803254.hpc4.ipa.aidigger.com'
ea=event_accumulator.EventAccumulator(root_dir+log_path)
ea.Reload()
print(ea.scalars.Keys())

det_acc=ea.scalars.Items('eval_detection_accuracy')
corr_acc=ea.scalars.Items('eval_correction_accuracy')
for det, corr in zip(det_acc,corr_acc):
    if det.step >= 8000:
        print(det.step, det.value, corr.value)
