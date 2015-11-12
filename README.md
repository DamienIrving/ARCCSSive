# ARCCSSive
ARCCSS Data Access Tools

[![Documentation Status](https://readthedocs.org/projects/arccssive/badge/?version=latest)](https://readthedocs.org/projects/arccssive/?badge=latest)
[![Build Status](https://travis-ci.org/coecms/ARCCSSive.svg?branch=master)](https://travis-ci.org/coecms/ARCCSSive)
[![codecov.io](http://codecov.io/github/coecms/ARCCSSive/coverage.svg?branch=master)](http://codecov.io/github/coecms/ARCCSSive?branch=master)
[![Code Health](https://landscape.io/github/coecms/ARCCSSive/master/landscape.svg?style=flat)](https://landscape.io/github/coecms/ARCCSSive/master)
[![Code Climate](https://codeclimate.com/github/coecms/ARCCSSive/badges/gpa.svg)](https://codeclimate.com/github/coecms/ARCCSSive)
[![PyPI version](https://badge.fury.io/py/ARCCSSive.svg)](https://pypi.python.org/pypi/ARCCSSive)

For full documentation please see http://arccssive.readthedocs.org/en/stable

CMIP5
=====

Query and access the CMIP5 data from Raijin

```python
from ARCCSSive import CMIP5, CMIP5.Model.Variable

session = CMIP5.DB.connect()
for output in session.query(Variable).filter_by(model='ACCESS1-0'):
    files = output.filenames()    
```

Uses
[SQLAlchemy](http://docs.sqlalchemy.org/en/rel_1_0/orm/tutorial.html#querying)
to filter and sort the data files.
