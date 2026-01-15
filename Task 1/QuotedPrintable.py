# Importing necessary functions from Quoted Printable module.
from quopri import encodestring, decodestring 

# Take user input
text = input("\nEnter a word from 8-bit ASCII: ")
print("") # For spacing to see the output better.

# The "encodestring" function takes data in bytes, not a string. 
dataInBytes = text.encode("UTF-8")
encodedBytes = (encodestring(dataInBytes))
print(encodedBytes, "\n")

# The "decodedstring" function gives the data in bytes.
decodedBytes = decodestring(encodedBytes)
decodedString = decodedBytes.decode("utf-8")
print(decodedString)