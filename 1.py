import re
a = "Tesing the all 65213 and the tabs and \n           Newline with        "
print(a)
alphabets = 0
digits = 0
spaces = 0
tabs = 0
lines = 0

for i in a:
    if i.isalpha():
        alphabets = alphabets + 1
    elif i.isdigit():
        digits = digits + 1
    elif i.isspace():
        spaces = spaces + 1

    if re.match(r'^\t+$', i):
        tabs = tabs + 1
    elif re.match(r'^\n+$', i):
        lines = lines + 1

print("The number of Alphabets are {}".format(alphabets))
print("The number of Numericals are {}".format(digits))
print("The number of Spaces are {}".format(spaces))
print("The number of Tabs are {}".format(tabs))
print("The number of NewLines are {}".format(lines))
