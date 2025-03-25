#######################################
#               Pacman                #
#######################################

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pacupg='doas pacman -Syu'
alias pacins='doas pacman -S'
alias paclean='doas pacman -Sc'
alias pacin='doas pacman -U'
alias paclr='doas pacman -Scc'
alias pacrmv='doas pacman -Rnsc'
# alias pacrem='pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro doas pacman -Rn'
alias pacrem='paruz -R'
alias pacrep='pacman -Si'
alias pacreps='pacman -Ss'
alias pacloc='pacman -Qi'
alias paclocs='pacman -Qs'
alias pacinsd='doas pacman -S --asdeps'
alias pacmir='doas pacman -Syy'
alias paclsorphans='doas pacman -Qdt'
alias pacrmorphans='doas pacman -Rs $(pacman -Qtdq)'
alias pacfileupg='doas pacman -Fy'
alias pacfiles='pacman -F'
alias pacls='pacman -Ql'
alias pacown='pacman -Qo'
alias pacupd="doas pacman -Sy"
alias pacsize='expac -sH M "%-30n %m" | sort -rhk 2 | less '
function paclist() {
  # Based on https://bbs.archlinux.org/viewtopic.php?id=93683
  pacman -Qqe | \
    xargs -I '{}' \
      expac "${bold_color}% 20n ${fg_no_bold[white]}%d${reset_color}" '{}'
}

function pacdisowned() {
  local tmp db fs
  tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
  db=$tmp/db
  fs=$tmp/fs

  mkdir "$tmp"
  trap 'rm -rf "$tmp"' EXIT

  pacman -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr ! -name lost+found \
    \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"
}

alias pacmanallkeys='doas pacman-key --refresh-keys'

function pacmansignkeys() {
  local key
  for key in $@; do
    doas pacman-key --recv-keys $key
    doas pacman-key --lsign-key $key
    printf 'trust\n3\n' | doas gpg --homedir /etc/pacman.d/gnupg \
      --no-permission-warning --command-fd 0 --edit-key $key
  done
}

if (( $+commands[xdg-open] )); then
  function pacweb() {
    if [[ $# = 0 || "$1" =~ '--help|-h' ]]; then
      local underline_color="\e[${color[underline]}m"
      echo "$0 - open the website of an ArchLinux package"
      echo
      echo "Usage:"
      echo "    $bold_color$0$reset_color ${underline_color}target${reset_color}"
      return 1
    fi

    local pkg="$1"
    local infos="$(LANG=C pacman -Si "$pkg")"
    if [[ -z "$infos" ]]; then
      return
    fi
    local repo="$(grep -m 1 '^Repo' <<< "$infos" | grep -oP '[^ ]+$')"
    local arch="$(grep -m 1 '^Arch' <<< "$infos" | grep -oP '[^ ]+$')"
    xdg-open "https://www.archlinux.org/packages/$repo/$arch/$pkg/" &>/dev/null
  }
fi

#######################################
#             AUR helpers             #
#######################################

if (( $+commands[aura] )); then
  alias auin='doas aura -S'
  alias aurin='doas aura -A'
  alias auclean='doas aura -Sc'
  alias auclr='doas aura -Scc'
  alias auins='doas aura -U'
  alias auinsd='doas aura -S --asdeps'
  alias aurinsd='doas aura -A --asdeps'
  alias auloc='aura -Qi'
  alias aulocs='aura -Qs'
  alias aulst='aura -Qe'
  alias aumir='doas aura -Syy'
  alias aurph='doas aura -Oj'
  alias aure='doas aura -R'
  alias aurem='doas aura -Rns'
  alias aurep='aura -Si'
  alias aurrep='aura -Ai'
  alias aureps='aura -As --both'
  alias auras='aura -As --both'
  alias auupd="doas aura -Sy"
  alias auupg='doas sh -c "aura -Syu              && aura -Au"'
  alias ausu='doas sh -c "aura -Syu --no-confirm && aura -Au --no-confirm"'

  # extra bonus specially for aura
  alias auown="aura -Qqo"
  alias auls="aura -Qql"
  function auownloc() { aura -Qi  $(aura -Qqo $@); }
  function auownls () { aura -Qql $(aura -Qqo $@); }
fi

if (( $+commands[pacaur] )); then
  alias pacclean='pacaur -Sc'
  alias pacclr='pacaur -Scc'
  alias paupg='pacaur -Syu'
  alias pasu='pacaur -Syu --noconfirm'
  alias pain='pacaur -S'
  alias pains='pacaur -U'
  alias pare='pacaur -R'
  alias parem='pacaur -Rns'
  alias parep='pacaur -Si'
  alias pareps='pacaur -Ss'
  alias paloc='pacaur -Qi'
  alias palocs='pacaur -Qs'
  alias palst='pacaur -Qe'
  alias paorph='pacaur -Qtd'
  alias painsd='pacaur -S --asdeps'
  alias pamir='pacaur -Syy'
  alias paupd="pacaur -Sy"
fi

if (( $+commands[trizen] )); then
  alias trconf='trizen -C'
  alias trupg='trizen -Syua'
  alias trsu='trizen -Syua --noconfirm'
  alias trin='trizen -S'
  alias trclean='trizen -Sc'
  alias trclr='trizen -Scc'
  alias trins='trizen -U'
  alias trre='trizen -R'
  alias trrem='trizen -Rns'
  alias trrep='trizen -Si'
  alias trreps='trizen -Ss'
  alias trloc='trizen -Qi'
  alias trlocs='trizen -Qs'
  alias trlst='trizen -Qe'
  alias trorph='trizen -Qtd'
  alias trinsd='trizen -S --asdeps'
  alias trmir='trizen -Syy'
  alias trupd="trizen -Sy"
fi

if (( $+commands[paru] )); then
  alias yaconf='paru -Pg'
  alias yaclean='paru -Sc'
  alias yaclr='paru -Scc'
  alias yaupg='paru -Syu'
  alias yasu='paru -Syu --noconfirm'
  alias yain='paru -S'
  alias yains='paru -U'
  alias yare='paru -R'
  alias yarem='paru -Rns'
  alias yarep='paru -Si'
  alias yareps='paru -Ss'
  alias yaloc='paru -Qi'
  alias yalocs='paru -Qs'
  alias yalst='paru -Qe'
  alias yaorph='paru -Qtd'
  alias yainsd='paru -S --asdeps'
  alias yamir='paru -Syy'
  alias yaupd="paru -Sy"
fi

# Check Arch Linux PGP Keyring before System Upgrade to prevent failure.
function upgrade() {
  echo ":: Checking Arch Linux PGP Keyring..."
  local installedver="$(doas pacman -Qi archlinux-keyring | grep -Po '(?<=Version         : ).*')"
  local currentver="$(doas pacman -Si archlinux-keyring | grep -Po '(?<=Version         : ).*')"
  if [ $installedver != $currentver ]; then
    echo " Arch Linux PGP Keyring is out of date."
    echo " Updating before full system upgrade."
    doas pacman -Sy --needed --noconfirm archlinux-keyring
  else
    echo " Arch Linux PGP Keyring is up to date."
    echo " Proceeding with full system upgrade."
  fi
  if (( $+commands[paru] )); then
    paru -Syu
  elif (( $+commands[trizen] )); then
    trizen -Syu
  elif (( $+commands[pacaur] )); then
    pacaur -Syu
  elif (( $+commands[aura] )); then
    doas aura -Syu
  else
    doas pacman -Syu
  fi
}
