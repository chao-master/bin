_cRestore=$(echo -en '\001\033[0m\002')
_cRed=$(echo -en '\001\033[00;31m\002')
_cGreen=$(echo -en '\001\033[00;32m\002')
_cYellow=$(echo -en '\001\033[00;33m\002')
_cBlue=$(echo -en '\001\033[00;34m\002')
_cMagenta=$(echo -en '\001\033[00;35m\002')
_cPurple=$(echo -en '\001\033[00;35m\002')
_cCyan=$(echo -en '\001\033[00;36m\002')
_cLGray=$(echo -en '\001\033[00;37m\002')
_cLRed=$(echo -en '\001\033[01;31m\002')
_cLGreen=$(echo -en '\001\033[01;32m\002')
_cLYellow=$(echo -en '\001\033[01;33m\002')
_cLBlue=$(echo -en '\001\033[01;34m\002')
_cLMagenta=$(echo -en '\001\033[01;35m\002')
_cLPurple=$(echo -en '\001\033[01;35m\002')
_cLCyan=$(echo -en '\001\033[01;36m\002')
_cWhite=$(echo -en '\001\033[01;37m\002')

__ps1_ec(){
  local exit=$?
  local label;
  local col;
  
  case $exit in
    0) return $exit ;;
    1)
      col=$_cRed
      label="x"
      ;;
    127)
      col=$_cYellow
      label="?"
      ;;
    *)
      if [ $exit -gt "128" ]; then
        local sig=$((exit - 128));
        col=$_cLRed
        case $sig in
          2) label="^C" ;;
          9) label="-9" ;;
          # This is slow, if you care you can manually add a loopup
          *) label=$(trap -l | grep -oP '(?<=\b'$sig'\) SIG)\w*') ;; 
        esac
      else
        col=$_cRed
        label=$exit
      fi
      ;;
  esac

  echo " $col[$label]";
  return $exit
}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_DESCRIBE_STYLE=branch

# PS1:  
  # \[            
  # \033          
  # ]0;           
  # $PWD          
  # \007          
  # \]            
  # \n            
  # ${_cGreen}    Set colour to green
  # \u              Print User name
  # ${_cYellow}   Set colour to yellow
  # \w              Print present working directory
  # ${_cCyan}     Set colour to cyan
  # `__git_ps1`     Print git ps1 help
  # `__ps1_ec`      Print exit code identifier
  # ${_cRestore}  Back to default colouring
  # \n            New Line
  # $             '$' Literal
PS1='\[\033]0;$PWD\007\]\n${_cGreen}\u ${_cYellow}\w${_cCyan}`__git_ps1``__ps1_ec`${_cRestore}\n$ '


man(){
  $1 --help | less
}

PATH=$PATH:"/c/Program Files (x86)/Notepad++"
PATH=$PATH:"/c/Program Files (x86)/Android/android-sdk/platform-tools"
PATH=$PATH:"/c/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise/Common7/IDE/CommonExtensions/Microsoft/TeamFoundation/Team Explorer"
#PATH=$PATH:'/C/Users/stuart.watson/Downloads/GitTfs-0.27.0'
PATH=$PATH:'/c/Program Files/nodejs/'
PATH=$PATH:'/c/Users/stuart.watson/AppData/Local/Programs/Microsoft VS Code/bin'
PATH=$PATH:'/C/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/Common7/IDE/' #devenv
PATH=$PATH:'/c/Program Files (x86)/Microsoft Visual Studio/2019/Enterprise/MSBuild/Current/Bin/'
PATH=$PATH:'/c/Program Files/Android/jdk/microsoft_dist_openjdk_1.8.0.25/jre/bin' #java


alias l="ls -F"
alias nppp=notepad++
alias nppn="nppp -multiInst -nosession -notabbar -alwaysOnTop"
alias sudo="powershell -Command '& Start-Process \"C:\Program Files\Git\git-bash.exe\" -Verb runAs'"
alias msbuild="msbuild.exe"
alias bundletool="java -jar ~/bin/bundletool-all-1.5.0.jar"


export LC_ALL=en_GB.utf8
PROMPT_COMMAND='history -a'
