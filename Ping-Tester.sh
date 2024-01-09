#!/bin/bash

# Check if a file path is provided as a command-line argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path=$1

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File not found"
    exit 1
fi

# Define colors for better output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo '
 __                 __      __             __                
/   _ _ _ |_ _ _|  |__)    |__)_  _|_|_   |__)|_  _  _  _ |_ 
\__| (-(_||_(-(_|  |__)\/  |  (_|| |_| )  |__)| )(_|(_)(_||_ 
                       /                            _/       
                       '
# Function to ping a server and display the result
ping_server() {
    local server_ip=$1
    if ping -c 2 "$server_ip" &> /dev/null; then
        echo -e "${GREEN}Ping successful for $server_ip${NC}"
    else
        echo -e "${RED}Ping failed for $server_ip${NC}"
        echo "$server_ip" >> failed_pings.txt
    fi
}

# Remove previous failed_pings.txt if it exists
rm -f failed_pings.txt

# Loop through each line in the file and ping the server in the background
while IFS= read -r server_ip; do
    ping_server "$server_ip" &
done < "$file_path"

# Wait for all background processes to finish
wait

echo "------------------------"
echo "Ping tests completed."

# Display the final summary of failed pings
if [ -f failed_pings.txt ]; then
    echo -e "\n${RED}Failed Pings:${NC}"
    cat failed_pings.txt
    rm -f failed_pings.txt
else
    echo -e "\n${GREEN}All pings were successful.${NC}"
fi

