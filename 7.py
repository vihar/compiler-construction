global count
count = 0
s = raw_input("Enter the string")


def E():
    T()
    E1()
    return


def T():
    F()
    T1()
    return


def E1():
    global count
    if s[count] == '+':
        count += 1
        T()
        E1()
    return


def F():
    global count
    if s[count] == 'i':
        count += 2
    elif s[count] == '(':
        count += 1
        E()
        if s[count] == ')':
            count += 1
        return
    else:
        print "id accepted"
        return


def T1():
    global count
    if s[count] == '*':
        count += 1
        F()
        T1()
    return


E()
print(count)
if s[count] == '$':
    print "String accepted"
else:
    print "String not accepted"
