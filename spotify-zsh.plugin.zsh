export mediaPlayer="spotify"  # Set your media player here if different

message_log="true"  # Set to "true" to enable log messages
lang="en"  # Set desired language: "en" for English, "pt-br" for Brazilian Portuguese

# Function to set log messages based on language and count
function setMessageLog() {
    local command="$1"
    local count="$2"

    case "$lang" in
        "en")
            case "$command" in
                play) echo "Music started";;
                pause) echo "Music paused";;
                play-pause) echo "Toggled play/pause";;
                previous) echo "Previous track ($count times)";;
                next) echo "Next track ($count times)";;
                *) echo "Command $command executed";;  # If none of the above cases apply
            esac
            ;;
        "pt-br")
            case "$command" in
                play) echo "Music started";;
                pause) echo "Music paused";;
                play-pause) echo "Toggled play/pause";;
                previous) echo "Previous track ($count times)";;
                next) echo "Next track ($count times)";;
                *) echo "Command $command executed";;  # If none of the above cases apply
            esac
            ;;
        *)
            echo "Unsupported language"
            ;;
    esac
}

# Function to send commands and display corresponding logs using playerctl
function actionPlayer() {
    local command="$1"
    local count="$2"
    
    run "$count" playerctl --player=$mediaPlayer $command
    
    if [ "$message_log" = "true" ]; then
        setMessageLog "$command" "$count"
    fi
}

# Function to repeat commands using the 'run' function
function run() {
    local number=$1
    shift
    if [ "$number" -gt 0 ]; then
        for i in $(seq "$number"); do
            "$@"
        done
    fi
}

# Function to get current track information using playerctl
function getCurrentTrackInfo() {
    local format="{{ artist }} - {{ album }} - {{ title }}"
    
    local track_info=$(playerctl --player=$mediaPlayer metadata --format "$format")
    echo "$track_info"
}

# Function to skip to the next track
function spotifyNext() {
    local count=${1:-1}  # Default number of tracks forward is 1
    
    actionPlayer "next" "$count"
    
    # Get current track information
    local current_track_info=$(getCurrentTrackInfo)
    echo "$current_track_info"
}

# Function to skip to the previous track
function spotifyPrevious() {
    local count=${1:-1}  # Default number of tracks backward is 1
    
    actionPlayer "previous" "$count"
    
    # Get current track information
    local current_track_info=$(getCurrentTrackInfo)
    echo "$current_track_info"
}

# Specific functions for each command
function spotifyPlay() {
    actionPlayer "play" "1"
}

function spotifyPause() {
    actionPlayer "pause" "1"
}

function spotifyToggle() {
    actionPlayer "play-pause" "1"
}

# Aliases to simplify usage
alias spPlay="spotifyPlay"
alias spPause="spotifyPause"
alias spToggle="spotifyToggle"
alias spNext="spotifyNext"
alias spPrev="spotifyPrevious"
