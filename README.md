
Ping Test Script
This Bash script performs ping tests on a list of servers provided in a text file. It checks the reachability of each server and displays a summary of successful and failed pings.

Usage : 
./ping_test.sh <file_path>
Replace <file_path> with the path to the text file containing a list of server IP addresses or hostnames, one per line.

Features
[+] Color-coded Output: Provides color-coded output for easy identification of successful and failed pings.
[+] Background Processing: Utilizes background processes to perform parallel ping tests, improving efficiency.
[+] Summary: Displays a final summary of successful and failed pings.
[+] Log Failed Pings: Logs failed pings to a file named failed_pings.txt for further analysis.

How to Use :-
1. Make the script executable:  chmod +x ping_test.sh
2. Run the script with the path to the file containing server addresses: ./ping_test.sh servers.txt

Review the color-coded output to identify successful and failed pings.
Check the failed_pings.txt file for a detailed list of servers that failed the ping test.
Feel free to customize the script to suit your needs or contribute to its improvement!
