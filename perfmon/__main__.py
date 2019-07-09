#!/usr/bin/env python3

import sys
import os.path
path = os.path.realpath(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(os.path.dirname(path)))

import perfmon 

if __name__ == '__main__':
    perfmon.main()


