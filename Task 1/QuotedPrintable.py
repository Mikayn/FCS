from quopri import encodestring, decodestring

text = input("Enter a word from 8-bit ASCII: ")

dataInBytes = text.encode("UTF-8")

print(encodestring(dataInBytes))