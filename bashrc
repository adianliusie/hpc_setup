# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
function jpt(){
	source /home/al826/rds/hpc-work/envs/env_1/bin/activate	
	jupyter-notebook --no-browser --port=7297
}

#Environmental variables
export TRANSFORMERS_CACHE='/home/al826/rds/hpc-work/envs/.cache/huggingface/transformers'

