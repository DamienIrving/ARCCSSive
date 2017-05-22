#!/usr/bin/env python
# Copyright 2017 ARC Centre of Excellence for Climate Systems Science
# author: Scott Wales <scott.wales@unimelb.edu.au>
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
from __future__ import print_function

from ARCCSSive.model import *
from ARCCSSive.model.cmip5 import *
from ARCCSSive.db import connect, Session

import pytest
import psycopg2
import getpass

@pytest.fixture(scope='session')
def database():
    # Travis connection
    try:
        engine = connect('postgresql://localhost/postgres', user='postgres', password='', echo=True)
        engine.connect()
    except Exception:
        import private
        engine = private.connect()

    yield Session

@pytest.fixture()
def session(database):
    s = database()
    yield s
    s.rollback()

def test_path(session):
    q = session.query(base.Path).limit(5)
    assert q.count() == 5

def test_metadata(session):
    q = session.query(base.Metadata).limit(5)
    assert q.count() == 5

def test_cf(session):
    q = session.query(cfnetcdf.File).limit(5)
    assert q.count() == 5

    q = q.first()
    assert len(q.variables) > 0

def test_cmip5(session):
    q = session.query(cfnetcdf.File).filter_by(collection='CMIP5').first()
    assert q.experiment_id is not None

    assert len(q.variables) > 0

def test_version_override(session):
    value = 'v99999999'
    q = (session.query(Version)
            .outerjoin(VersionOverride)
            .filter(VersionOverride.version_id == None)
            .first())
    o = VersionOverride(version_number = value)
    q.override = o
    session.add(q)
    session.commit()
    assert q.version_number == value
    session.delete(o)
    session.commit()
    assert q.version_number != value
