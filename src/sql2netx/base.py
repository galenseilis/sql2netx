import networkx as nx
import sqlglot
from sqlglot.expressions import Join, Table,

class SQLJoinNet:
    '''Network analysis of joins in SQL queries.
    '''

    def __int__(self, dialect=None):
        self.multidgraph = nx.MultiDigraph()

    def fit(self, X, y=None):
        '''Learn network structure of joins.'''
        raise NotImplementedError

        self.multidigraph = nx.MultiDigraph()

        join_expr = sqlglot.expression
        for query_str in queries:
            parsed_sql = sqlglot(query_str)
            print(parsed_sql)
            for join_str in parsed_sql.find_all(Join):
                print(join_str) # TODO: Look at what str processing is needed

    def partial_fit(self, X, y=None):
        '''Incrementally learn network structure of joins.'''
        raise NotImplementedError

        # TODO: It model has not been fit, then call self.fit
        # else have logic to add to what was learned.

    def steiner(self, targets=None):
        '''Find a Steiner tree for a set of target attributes.'''
        # TODO: Need to handle multiple edges.
        # TODO: Decide on rules for choosing weights.
        raise NotImplementedError
