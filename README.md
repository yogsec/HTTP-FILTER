# HTTP FILTER | Designed By YogSec
[HTTP-FILTER](https://github.com/yogsec/HTTP-FILTER/blob/main/Screenshot%20from%202025-02-19%2013-21-00.png)
## Overview
HTTP FILTER is a Bash tool designed to simplify the process of analyzing HTTP responses from a list of URLs. It was developed by YogSec to aid security researchers, penetration testers, and bug bounty hunters in quickly identifying interesting and anomalous HTTP responses.

When working with a large set of URLs, it can be time-consuming to manually inspect each response code. HTTP FILTER automates this task by concurrently sending HTTP requests to each URL and categorizing the responses into separate files based on their status codes. This tool is optimized for speed and efficiency, making it a valuable asset for anyone involved in cybersecurity.

## Key Features
- Concurrent processing of multiple URLs for speed.
- Categorizes URLs based on HTTP response codes (e.g., 200.txt, 404.txt, 500.txt).
- Failed requests are logged into a separate `failed.txt` file.
- Outputs results into a directory named after the input file.
- Supports checking a single URL or processing a list of URLs.
- Color-coded terminal output for better visibility.
- Simple and easy-to-use interface.

## Problem
Security researchers and penetration testers often deal with a massive number of URLs during reconnaissance and testing phases. Manually visiting each URL and checking HTTP responses is inefficient and error-prone. Identifying URLs with interesting or problematic responses like `500 Internal Server Error` or `403 Forbidden` can be crucial for detecting vulnerabilities. However, traditional methods can be slow and tedious.

## Solution
HTTP FILTER automates this process by:
- Fetching HTTP responses concurrently using multiple processes.
- Logging URLs into separate files based on their HTTP response codes.
- Quickly identifying potentially vulnerable or misconfigured endpoints.
- Saving time and effort while improving accuracy.

## Usage
```bash
./http_filter.sh [options]
```

### Options
- `-h` : Show help message
- `-v` : Show version information
- `-l <file>` : Process a list of URLs from a file
- `-d <url>` : Check a single URL

### Example
#### Check a single URL
```bash
./http_filter.sh -d https://example.com
```

#### Process a list of URLs from a file
```bash
./http_filter.sh -l urls.txt
```
This will create a directory `urls_responses` and generate text files like:
- `200.txt` – Contains all URLs with 200 OK responses
- `404.txt` – Contains all URLs with 404 Not Found responses
- `500.txt` – Contains all URLs with 500 Internal Server Error responses
- `failed.txt` – Contains all URLs that could not be reached

## Example Output
```
[200] https://example.com
[404] https://example.com/notfound
[500] https://example.com/servererror
[FAILED] https://example.com/timeout
```

## Requirements
- Bash
- curl

## Installation
```bash
chmod +x http_filter.sh
```

## 🌟 Let's Connect!

Hello, Hacker! 👋 We'd love to stay connected with you. Reach out to us on any of these platforms and let's build something amazing together:

🌐 **Website:** [https://yogsec.github.io/yogsec/](https://yogsec.github.io/yogsec/)  
📜 **Linktree:** [https://linktr.ee/yogsec](https://linktr.ee/yogsec)  
🔗 **GitHub:** [https://github.com/yogsec](https://github.com/yogsec)  
💼 **LinkedIn (Company):** [https://www.linkedin.com/company/yogsec/](https://www.linkedin.com/company/yogsec/)  
📷 **Instagram:** [https://www.instagram.com/yogsec.io/](https://www.instagram.com/yogsec.io/)  
🐦 **Twitter (X):** [https://x.com/yogsec](https://x.com/yogsec)  
👨‍💼 **Personal LinkedIn:** [https://www.linkedin.com/in/bug-bounty-hunter/](https://www.linkedin.com/in/bug-bounty-hunter/)  
📧 **Email:** abhinavsingwal@gmail.com

## ☕ Buy Me a Coffee

If you find our work helpful and would like to support us, consider buying us a coffee. Your support keeps us motivated and helps us create more awesome content. ❤️

☕ **Support Us Here:** [https://buymeacoffee.com/yogsec](https://buymeacoffee.com/yogsec)

## Credits
Developed by YogSec

