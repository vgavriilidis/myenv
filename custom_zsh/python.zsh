alias upgrade_python='python3 -m pip install --upgrade pip'

# use my python envs
source ~/.my_python_envs.sh

create_python_env_better(){
    python_env=$1
    python_version=$2

    echo "Install python if not already installed"
    pyenv install $python_version -s
    echo "Done!"

    echo "Create virtualenv "
    pyenv virtualenv $python_version $python_env
    echo "Created!"

    echo "Create alias"
    echo "alias set_python_$1='source ~/.pyenv/versions/$2/envs/$1/bin/activate'" >> ~/.my_python_envs.sh

    echo "to use it: set_python_$1"
    source ~/.my_python_envs.sh
}

bind_python_env(){
    echo "Create .envrc, make sure there is pyenv enabled"

    echo "export VIRTUAL_ENV=$VIRTUAL_ENV" > .envrc
    echo 'export PATH=$PATH:$VIRTUAL_ENV/bin' >> .envrc
    echo "layout python3" >> .envrc
}
