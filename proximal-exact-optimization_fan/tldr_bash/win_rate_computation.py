
import sys
import os 
import json

loss_type = sys.argv[1]

#"online_pp-exo-rw"

print("--------------------")
print("loss_type",loss_type)
print("--------------------")
path1="/fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/sft/eval/test.json"
path11="exp/tldr_exp/data/tldr/eval/test.json"
for i in [1,2,3,4,5]:
    path2="/fs-computility/mabasic/zhanghangfan/oss/xsy/proximal-exact-optimization/models/pythia-2.8b_tldr/align_"+loss_type+"_nc2/ckpt"+str(i)+"/eval/test.json"

    data = json.load(open(path1, "r"))
    data1 = json.load(open(path11, "r"))
    data2 = json.load(open(path2, "r"))
    assert len(data) == len(data2)

    total_number = len(data)

    win_total = 0

    win_total_chosen = 0

    total_reward = 0

    for j in range(len(data)):
        line = data[j]
        line1 = data1[j]
        line2 = data2[j]
        rewards_sft=[row[0] for row in line["scores_texts"]]
        rewards_tldr=[row[0] for row in line1["scores_texts"]]
        rewards_win=[row[0] for row in line2["scores_texts"]]

        win_numer_temp=0
        win_choose_temp=0
        reward_temp = 0
        for reward000 in rewards_sft:
            for reward111 in rewards_win:
                if reward111 >= reward000:
                    win_numer_temp += 1
        win_total += win_numer_temp / (len(rewards_sft) * len(rewards_win))


        for reward111 in rewards_win:
            if reward111 >= max(rewards_tldr):
                win_choose_temp += 1
        win_total_chosen += win_choose_temp / len(rewards_win)

        for reward111 in rewards_win:
            reward_temp += reward111
        total_reward += reward_temp / len(rewards_win)


                

    print("--------------------")
    print("Checkpoint_finish",i)
    print("win_total",win_total/total_number)
    print("win_total_chosen",win_total_chosen/total_number)
    print("total_reward",total_reward/total_number)
    print("--------------------")


print("--------------------")
print("Finish",loss_type)
print("--------------------")