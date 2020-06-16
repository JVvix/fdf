function cdf { cd $env:userprofile\fdf }
function cds { cd $env:userprofile\src }
function gs  { git status }
function addgithelper { 
    echo "[credential]" >> test45
    echo '        helper =' >> test45
}

function v($file) { 
    echo "starting 'neovim-qt $file'..."
    & $env:userprofile\fdf\bin\neovim\bin\nvim-qt.exe $file
}

echo "Faye's profile.ps1 loaded"
echo "type: '. `$profile' to reload..."

