#!/bin/bash
pip install -r requirements.txt
pip uninstall -y spb-cli
pip install spb-cli
jupyter notebook --ip=0.0.0.0 --allow-root
