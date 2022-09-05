#!/bin/zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/caio/.mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/caio/.mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/caio/.mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/caio/.mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/caio/.mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/caio/.mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# mamba create -n utils python=3.9.12
mamba activate utils
mamba install pynvim black
pip install --user libtmux
# pip install pillow-simd ueberzug
mamba deactivate
ln -s ~/.mambaforge/envs/utils/bin/black ~/.local/bin
ln -s ~/.mambaforge/envs/utils/bin/libmux ~/.local/bin

mamba create -n dev python=3.9.12
mamba activate dev
mamba install ipython jupyter jupyter_ascending jupytext
jupyter nbextension install --py --sys-prefix jupyter_ascending
jupyter nbextension     enable jupyter_ascending --sys-prefix --py
jupyter serverextension enable jupyter_ascending --sys-prefix --py
mamba deactivate
