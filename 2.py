import re
scanner = re.Scanner([
    (r"[0-9]+", lambda scanner, token:("INTEGER", token)),
    (r"[a-z_]+", lambda scanner, token:("IDENTIFIER", token)),
    (r"[,.]+", lambda scanner, token:("PUNCTUATION", token)),
    (r"\s+", None),  # None == skip token.
])

results, remainder = scanner.scan("45 pigeons, 23 cows, 11 spiders.")
print(results)
