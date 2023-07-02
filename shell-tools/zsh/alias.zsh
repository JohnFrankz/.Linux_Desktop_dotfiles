export MANPAGER="sh -c 'col -bx | bat -l man -p'"

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

alias rm='echo "This is not the command you are looking for, try trash instead."; false'

alias t2en='trans :en'
alias t2zh='trans :zh'
alias t2eni='trans :en -shell -brief'
alias t2zhi='trans :zh -shell -brief'

# This is a function to calculate the total duration of all mp4 files in a 
# directory.
gettd() {
    _default_directory_="."
    _show_calculation_time_=false
    directory="$1"

    if [ -z "$directory" ]; then
        directory="$_default_directory_"
    fi

    if [ "$_show_calculation_time_" = true ]; then
        start_time=$(date +%s)
    fi

    # get total duration of all mp4 files in the directory by using ffprobe,
    # It is much slower than mediainfo.
    # duration=$(find "$directory" -name "*.mp4" -print0 | xargs -0 -P "$(nproc)" -I{} sh -c 'ffprobe -v error -select_streams v -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1" 2>/dev/null' -- {} | awk '{total += $1} END {print int(total)}')

    # get total duration of all mp4 files in the directory by using mediainfo.
    duration=$(find "$directory" -name "*.mp4" -print0 | xargs -0 -P "$(nproc)" -I{} sh -c 'mediainfo --Output="General;%Duration%" "$1"' -- {} | awk '{total += $1} END {print int(total/1000)}')
    
    hours=$((duration / 3600))
    minutes=$((duration % 3600 / 60))
    seconds=$((duration % 60))

    echo "Total duration in $directory: ${hours}h ${minutes}m ${seconds}s"

    if [ "$_show_calculation_time_" = true ]; then
        end_time=$(date +%s)
        execution_time=$((end_time - start_time))
        echo "Calculation time: ${execution_time}s"
    fi
}

