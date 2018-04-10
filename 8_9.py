
from collections import OrderedDict

rules = []
firsts = []
rules_dict = OrderedDict()
firsts_dict = OrderedDict()
follow_dict = OrderedDict()


with open("rules.txt", "r") as fp:
    for line in fp:
        rules.append(line.strip().split('\n'))


def non_term_appender(firsts, rules):
    for rule in rules:
        if rule[0][0] not in firsts:
            firsts.append(rule[0][0])
            firsts_dict[rule[0][0]] = []
            follow_dict[rule[0][0]] = []


number_of_rules = len(rules)
rule_count = first_count = 0
non_term_appender(firsts, rules)

for first in firsts:
    rules_dict[first] = rules[rule_count][0][3:]
    rule_count += 1

for rule in rules:
    if rule[0][3].islower():
        firsts_dict[rule[0][0]].extend(rule[0][3])

for rule in rules:
    if rule[0][3].isupper():
        firsts_dict[rule[0][0]].extend(firsts_dict[rule[0][3]])

with open("firsts.txt", "w+") as wp:
    for k in firsts_dict:
        wp.write("first(%s): \t " % k)
        wp.write("%s\n" % firsts_dict[k])

rules_keys = rules_dict.keys()
key_count = len(rules_keys)

for k in rules_dict:
    tmp_rule_str = rules_dict[k]
    if k == rules_keys[0]:
        follow_dict[k].append('$')
    for i in xrange(key_count):
        if rules_keys[i] in tmp_rule_str:

            tmp_rule_list = list(tmp_rule_str)

            current_non_term_index = tmp_rule_list.index(rules_keys[i])

            if current_non_term_index == (len(tmp_rule_list) - 1):
                follow_dict[rules_keys[i]].extend(follow_dict[rules_keys[0]])
            else:
                follow_dict[rules_keys[i]].extend(
                    firsts_dict[rules_keys[(i + 1) % key_count]])

with open("follows.txt", "w+") as wp:
    for k in follow_dict:
        wp.write("follow(%s): \t" % k)
        wp.write("%s\n" % follow_dict[k])


print "Firsts Dict:" + " "
print(follow_dict)
print "Follow Dict:" + " "
print(firsts_dict)
