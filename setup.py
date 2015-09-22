#!/usr/bin/env python
"""
Copyright 2015 ARC Centre of Excellence for Climate Systems Science

author: Scott Wales <scott.wales@unimelb.edu.au>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

from setuptools import setup

requirements = [
        'SQLAlchemy',
        'xray',
        ]

# Don't install dependencies when making docs
import os
on_rtd = os.environ.get('READTHEDOCS', None) == 'True'
if on_rtd:
    requirements = []

setup(
        name             = 'ARCCSSive',
        version          = '0.1.0',
        url              = 'https://github.com/coecms/ARCCSSive',
        packages         = ['ARCCSSive'],
        install_requires = requirements,
        )
