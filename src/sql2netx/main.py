import networkx as nx
import sqlparse

query = '''
SELECT *
FROM Table1 t1
INNER JOIN
    Table2  t2 ON t1.id = t2.id
LEFT JOIN
    Table3 ON Table2.id = Table3.id
RIGHT JOIN
    Table4 ON Table3.id = Table4.id
FULL JOIN
    Table5 ON Table4.id = Table5.id'''


##query = '''SELECT CCustomers.CustomerID, Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Payments.PaymentID, Payments.PaymentAmount
##FROM Customers
##INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
##LEFT JOIN Payments ON Customers.CustomerID = Payments.CustomerID;'''

alias_to_real = {}

g = nx.DiGraph()
parsed = sqlparse.parse(query)
for stmt in parsed:
    tokens = [token for token in stmt.tokens if not token.is_whitespace]
    for i, token in enumerate(tokens):
        if hasattr(token, 'get_real_name') and token.get_alias() is not None:
            alias_to_real[token.get_alias()] = token.get_real_name()
        if token.value == 'ON':
            left_table = tokens[i+1].token.left.get_parent_name()
            if left_table in alias_to_real:
                left_table = alias_to_real[left_table]
            right_table = tokens[i+1].token.right.get_parent_name()
            if right_table in alias_to_real:
                right_table = alias_to_real[right_table]
            g.add_edge(
                '.'.join([left_table, tokens[i+1].token.left.get_name()]),
                '.'.join([right_table, tokens[i+1].token.right.get_name()]),
                join_type=tokens[i-10].value
                )

import matplotlib.pyplot as plt
pos = nx.spring_layout(g)
edge_labels = nx.get_edge_attributes(g,'join_type')
nx.draw(g, pos, with_labels=True)
nx.draw_networkx_edge_labels(g, pos, edge_labels=nx.get_edge_attributes(g,'join_type'))
plt.show()
