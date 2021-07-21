#!/bin/bash
pip install $(awk '{print $1}' ../programs/pip.list)
