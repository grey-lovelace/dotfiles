alias test_dotfiles="echo 'Dotfiles are working!'"

alias ls="ls -ACHG --color $*"
alias gw="./gradlew $*"
alias gboot="./gradlew bootRun"
alias ns="npm run start"
alias dockerkill="docker kill $(docker ps -q)"
alias gc="git commit -m $*"

gitDeleteAllLocalButCurrent() {
    currentBranch=$(git branch --show-current)
    echo "Deleting all branches but $currentBranch"
    git branch | grep -v "$currentBranch" | xargs git branch -D
}

github() {
    tempurl=$(git remote get-url origin)
    tempurl=$(echo $tempurl | sed "s/git@/https:\/\//" )
    tempurl=$(echo $tempurl | sed "s/.com:/.com\//" )
    echo Opening $tempurl...
    xdg-open $tempurl
}

gitrap(){
    git branch -m $1
    git push -u origin $1
}

webm2mp4(){
    (( $# < 1 )) && { echo "Usage: webm2mp4 input.webm [output.mp4]"; return 1; }
    local in="$1"; shift
    local out="''${1:-''${in%.webm}.mp4}"
    ffmpeg -i "$in" \
        -c:v libx264 -preset slow -crf 18 \
        -c:a aac -b:a 320k \
        -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" \
        -movflags +faststart \
        "$out"
}