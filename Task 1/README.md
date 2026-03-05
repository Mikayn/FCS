# Enhancing Secure Data Exchange with Encoding Formats and Protocol Integration

## Project Overview

This project demonstrates how **encoding formats** (Base64, Quoted-Printable, ASCII) interact with **network protocols** (SMTP, HTTPS/TLS) to enable reliable and secure data transmission. It includes practical experiments covering:

* Email-safe encoding of text and binary data  
* File transfer over HTTPS using TLS  
* Analysis of encoding visibility vs encryption  
* Encoding-based obfuscation used by attackers  

The project is structured to allow direct, hands-on execution of each concept.

---

## Project Structure
```
Task 1/
├── README.md                              # Main project documentation
├── dockerstuff/
│   ├── https_server.py                    # HTTPS server implementation
│   ├── receiver.sh                        # Receiver script for handling connections
│   ├── servercontainer.sh                 # Script to manage Docker containers
│   └── sslcert.sh                         # SSL certificate generation script
├── images&output/
│   ├── 20CB.png                           # Output image file
│   ├── base64restored.bin                 # Restored binary from base64
│   └── imagebase64.txt                    # Base64 encoded image data
└── scripts/
    ├── Base64.py                          # Base64 encoding/decoding script
    ├── QuotedPrintable.py                 # Quoted-Printable encoding/decoding
    └── update.js                          # JavaScript update script
```
---

## Prerequisites

* Docker installed  
* Python 3.x  
* OpenSSL  
* curl or wget  
* Linux shell (or WSL on Windows)

### Clone the repository
```bash
https://github.com/Mikayn/FCS.git
cd Task 1/
```
---

## Encoding Demonstration 

### 1. Base64 Encoding and Decoding

**Purpose**: Demonstrate binary-to-text encoding for SMTP compatibility.

**Steps**
```bash
cd scripts
python Base64.py
```
**Output**
`<a href="https://github.com/Mikayn/FCS/blob/main/Task%201/images%26output/imagebase64.txt"> Image in base 64 </a>`   
`<a href="https://github.com/Mikayn/FCS/blob/main/Task%201/images%26output/base64restored.bin"> base64 restored into binary </a>`  

**Observation**
* Encoded data is ASCII-safe
* Fully reversible
* Data size increases

### 2. Quoted-Printable Encoding

**Purpose**: Demonstrate text encoding for non-ASCII characters.

**Steps**
```bash
cd scripts
python QuotedPrintable.py
```

**Output**

`<a href="https://github.com/Mikayn/FCS/blob/main/Task 1/images%26output/quotedprintable.txt"> Non-ascii text in quoted printable </a> `
Decoded output matches original input

**Observation**
* Human-readable
* Efficient for mostly-ASCII text
* Inefficient for binary data

---

## File Transfer Through HTTPS

### Generate TLS Certificate

**Purpose**: Enable HTTPS by creating SSL/TLS credentials.
```bash
cd dockerstuff
bash sslcert.sh
```
**Output**
` cert.pem  
key.pem `

### Start HTTPS Server in Docker

**Purpose**: Transfer a file securely from one container to another using HTTPS.
```bash
cd dockerstuff
bash servercontainer.sh
```

This runs https_server.py inside a Docker container using the generated TLS certificate.

### Download File Securely (Client Side)

**Purpose**: Verify encrypted file transfer.

```bash
bash receiver.sh
```
Or manually:
```bash
curl -k https://localhost:4443/20CB.png -o downloaded.png
```

**Observation**
*TLS handshake occurs
*Payload is encrypted in transit
*MITM attacks fail without keys

---

## Encoding-Based Obfuscation Analysis
### Encoded Malware Demonstration

File `scripts/update.js`

**Purpose**
* Show how attackers hide malicious logic using Base64
* Demonstrate why encoding ≠ security

**Steps**
* Inspect the Base64 strings in update.js
* Decode them using:
```bash
echo "<base64_string>" | base64 --decode
```

**Observation**
* Encoded payload reveals hidden execution logic
* Security tools must decode before inspection

---

## Key Findings
* Encoding solves compatibility, not security
* Encoded data is visible and reversible
* SMTP relies on encoding due to legacy constraints
* HTTP allows raw transfer but is insecure
* HTTPS + TLS ensures confidentiality and integrity
* Attackers abuse encoding for obfuscation
* Secure systems require proper protocol-layer encryption
* Recursive decoding is a must during security analysis

---

## Conclusion
* Encoding and encryption serve different roles and must not be conflated.
* Encoding: makes data transmissible
* Encryption: makes data secure

Modern secure communication depends on correct layering, not misuse of encoding as protection.
