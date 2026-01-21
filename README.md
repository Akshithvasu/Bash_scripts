# Bash Scripts – Monitoring & Website Checks

This repository contains simple Bash scripts created for learning and practicing
Linux, Bash scripting, and basic DevOps concepts.


### 1️⃣ `project1.sh`
- System monitoring script
- Checks:
  - CPU usage
  - Memory usage
  - Disk usage
- Compares current usage with user-provided thresholds

---

### 2️⃣ `project2.sh`
- Website availability and latency checker
- Reads website URLs from `input.txt`
- Uses `curl` to:
  - Check HTTP status codes
  - Measure response latency

---

### 3️⃣ `input.txt`
- Contains a list of websites (one per line)
- Used as input by `project2.sh`
### `Commands`
- git clone https://github.com/Akshithvasu/Bash_scripts.git
- cd Bash_scripts
- chmod +x project1.sh project2.sh
- ./project1.sh (for first one)
- ./project2.sh (for second one)

