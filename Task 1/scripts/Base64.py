# Importing necessary functions from base64 module
from base64 import b64encode, b64decode

# TEXT INTO BASE64

text = input("Enter a word: ")
print("") # For spacing to see the output better.

# The "b64encode" function takes data in bytes, not a string. 
dataInBytes = text.encode("UTF-8")
encodedBytes = (b64encode(dataInBytes))
print(encodedBytes)

# The "b64decode" function gives the data in bytes.
decodedBytes = b64decode(encodedBytes)
decodedString = decodedBytes.decode("utf-8")
# print(decodedString)


# IMAGE INTO BASE64

# # Conver the image file into bytes
# with open("20CB.png", "rb") as f:
#     data = f.read()

# # Encode the bytes into base 64
# encodedBytes = b64encode(data)

# #Convert the bytes into readable string
# encodedStr = encodedBytes.decode("utf-8")

# # Write the string in the file
# with open("base64.txt", "w") as f:
#     f.write(encodedStr)
#     print("\nCreated the file 'base64.txt' ")

# # Decode the base64 to get binary data
# decoded = b64decode(encodedBytes)

# # Write the binary data into a file
# with open("restored.bin", "wb") as f:
#     f.write(decoded)
#     print("Created the file 'restored.bin' ")
