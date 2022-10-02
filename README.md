## Getting Torch working on HPC 


### My HPC files
My SLURM submit script : [submit.sh](submit.sh) \
my .bashrc : [.bashrc](bashrc)\
python environment : [python_env.txt](python_env.txt)\
requirements.txt : [requirements.txt](requirements.txt) 

\*note that requirement.txt is not the same as the python environment, since installing a module can install multiple other modules, and secondly some libraries require external links to be downloaded

---
### Getting a basic working torch environment
This will now be a quick tutorial on how to get a working python environment that works on the Cambridge High Performance Computing (HPC) system with pytorch.

load python 3.8 into the session:
```
module load python/3.8
```
\
create a new environment:
```
python -m venv env_1
```
 
 \
activate the environment, upgrade pip, and install pytorch 1.9+cuda11.1:
```
source env_1/bin/activate 
pip install --upgrade pip
pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 -f https://download.pytorch.org/whl/torch_stable.html
```

\
This version of pytorch should work for both jobs on ampere and pascal machines on the HPC 

---
### Tested torch+cuda combinations (working on both ampere and pascal)
**torch 1.9 + cuda 11.1**
```
pip install torch==1.9.1+cu111 torchvision==0.10.1+cu111 torchaudio==0.9.1 -f https://download.pytorch.org/whl/torch_stable.html
```

**torch 1.10 + cuda 11.1**
```
pip install torch==1.10.0+cu111 torchvision==0.11.0+cu111 torchaudio==0.10.0 -f https://download.pytorch.org/whl/torch_stable.html
```

**torch 1.12 + cuda 11.3**
```
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
```

\*all of the above environments don't seem to require cuda to be loaded. I have commented out the module load line in the submit script, and it still works on gpu

#### Failed torch+cuda versions
torch1.12+cu11.6 (cuda 11.6 seems to be unavailable on the current machines) \
torch1.12+cu10.2 (cuda 10.2 is too old to work on ampere)

---
### Cuda
 
Certain GPU machines are only compatible with certain versions of cuda while pytorch is installed as only compatible with a certain version of cuda (as far as I understand).

Cuda versions available on hpc: [9.1, 9.2, 10.0, 10.1, 10.2, 11.0, 11.1, 11.2, 11.4] \
One can load different cuda versions using ```module load```. For example to load cuda 11.2, use
```
module load cuda/11.2
```

loading cuda is present in the submit script for cuda/10.0, though from experience this seems to be unnecessary.




