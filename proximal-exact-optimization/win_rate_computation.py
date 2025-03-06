
import sys
import os 
import json

loss_type = sys.argv[1]

#"online_pp-exo-rw"

print("--------------------")
print("loss_type",loss_type)
print("--------------------")
path1="exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/sft/orc_eval/test.json"
for i in [1,2,3,4,5]:
    path2="exp/imdb_exp/data/imdb_prefix10_infer_res/models/gpt2-large_imdb/align_"+loss_type+"_nc2/ckpt"+str(i)+"/orc_eval/test.json"

    data = json.load(open(path1, "r"))
    data2 = json.load(open(path2, "r"))
    assert len(data) == len(data2)
    for j in range(len(data)):
        line = data[j]
        line2 = data2[j]
        print([row[0] for row in line["scores_texts"]])
        print([row[0] for row in line2["scores_texts"]])
        input()

    print("--------------------")
    print("Checkpoint_finish",i)
    print("--------------------")


print("--------------------")
print("Finish",loss_type)
print("--------------------")