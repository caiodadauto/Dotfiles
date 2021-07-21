#!/bin/sh
pip install $(awk '{print $1}' ../programs/pip.list)
