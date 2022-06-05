#!/bin/bash

#SBATCH --nodes=1
#SBATCH --job-name=resnet18_cifar10_alt2                                              # job name
#SBATCH --workdir=/home/alpayozkan/	                    # working directory
#SBATCH --nodelist=romer1
#SBATCH --gres=gpu:1            # or you can specify gpu type: --gres=gpu:rtx2080ti:1					# how many gpu(s) will be reserved
#SBATCH --output=/home/alpayozkan/denge_exps/resnet18_cifar10_alt2-%j.out	              # output file
#SBATCH --error=/home/alpayozkan/denge_exps/resnet18_cifar10_alt2-%j.err	              # error file
#SBATCH --time=2-00:00:00				                                # max job time. (currently no need to use)


########### Cuda paths, you may not need that #############
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64
#########################################################

###### notebook to run
nb=main
nb_dir=~/.git/pytorch-cifar-exp


###### log wandb under denge_exps/
# dir=/home/alpayozkan/denge_exps

###### activate conda env
# conda init
# conda activate prob2
# source activate prob2

###### convert ipynb => py
# jupyter nbconvert --to python $nb_dir/$nb.ipynb
# mv $nb_dir/$nb.py $dir

###### train model
python $nb_dir/$nb.py
which nvcc

###### success message
echo "JOB DONE!!!"