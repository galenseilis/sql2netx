#!/usr/bin/env python
# coding: utf-8

import glob
from typing import NoReturn

import networkx as nx
import sqlglot
from sqlglot import exp
from sqlglot.optimizer.scope import build_scope
from sqlglot.optimizer.qualify import qualify
from sqlglot.expressions import Join, Table, Column

def read_file(file):
    with open(file, "r") as f:
        return f.read()

files = sorted(glob.glob("*.sql"))
str_query = read_file(files[12])
ast = sqlglot.parse_one(str_query)
root = build_scope(qualify(ast))

tables = [
    source.name
    for scope in root.traverse()
    for alias, (node, source) in (scope.selected_sources.items())
    if isinstance(source, exp.Table)
]

for join_exp in root.find_all(exp.Join):
    for j in join_exp.find_all(exp.Table):
        print(j.parent, j)

joins = [
    source.name
    for scope in root.traverse()
    for alias, (node, source) in (scope.selected_sources.items())
    if isinstance(source, exp.Join)
]

print(joins)
