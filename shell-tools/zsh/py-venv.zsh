source /home/rice/Development/python3-venv/default/bin/activate


alias pyvenv-default="source /home/rice/Development/python3-venv/default/bin/activate"
alias pyvenv-cs188="source /home/rice/Development/python3-venv/CS188/bin/activate"

check_venv() {
    if [[ -n $VIRTUAL_ENV ]]; then
        echo "Virtual environment is active at: $VIRTUAL_ENV"
    else
        echo "No virtual environment is active."
    fi
}

alias pyvenv="check_venv"
