export PATH=$PATH:/opt/homebrew/bin/
export PATH=$PATH:~/.cargo/bin/


open_python_server(){
    ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | head -n1
    python3 -m http.server
}
