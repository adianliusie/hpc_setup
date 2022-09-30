## Getting Torch working on HPC 


### My HPC files
My SLURM submit script : 
my .bashrc :
python environment :
requirements.txt :

\*note that requirement.txt is not the same as the python environment, since within requirements installing a module can install multiple other modules, and secondly some libraries require external links to be downloaded

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
### Cuda
 
As far as I understand, certain GPU machines are only compatible with certain versions of cuda:

one can load different cuda versions using ```module load```: For example to specifically load cuda 11.2:
```
module load cuda/11.2
```

\
additionally, if conda is used as the package manager, conda itself may download local cuda versions which environments can access.
