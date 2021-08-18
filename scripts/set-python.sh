#!/bin/zsh

pip install $(awk '{print $1}' ../programs/pip.list)
mamba install $(awk '{print $1}' "../programs/mamba-$1.list") -c conda-forge
jupyter nbextension install --py --sys-prefix jupyter_ascending
jupyter nbextension     enable jupyter_ascending --sys-prefix --py
jupyter serverextension enable jupyter_ascending --sys-prefix --py
