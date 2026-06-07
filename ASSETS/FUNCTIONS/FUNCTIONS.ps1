# -----------------------------------[ FUNCTION WRITE-COLOR ]--------------------------------- #
function Write-Color([String[]]$TEXT, [ConsoleColor[]]$COLOR) {for ($i = 0; $i -lt $TEXT.Length; $i++) {Write-Host $TEXT[$i] -Foreground $COLOR[$i] -NoNewline}Write-Host}
# -------------------------------------------------------------------------------------------- #

# -----------------------------------[ FUNCTION CENTER-TEXT ]--------------------------------- #
function Center-Text {param([string]$Text,[int]$Width) $padding = [Math]::Max(0, [Math]::Floor(($Width - $Text.Length) / 2)); return (" " * $padding + $Text)}
$width = 74
# -------------------------------------------------------------------------------------------- #

# ---------------------------------------[ FUNCTION DATE ]------------------------------------ #
function Date{$DATE = Get-Date;$DATE_DISPLAY = $date.ToString("yyyy-MM-dd");Write-Output $DATE_DISPLAY}
# -------------------------------------------------------------------------------------------- #

# --------------------------------------[ FUNCTION BANNER ]----------------------------------- #
function Banner{Write-Color "
╔══════════════════════════════════════════════════════════════════════════╗          
║                ██████╗  █████╗ ██████╗ ██╗██████╗  • RapidResolve        ║
║         ,/     ██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗ • By 0xm4rk1h         ║
║       ,'/      ██████╔╝███████║██████╔╝██║██║  ██║ • Version : 1.0.0     ║
║     ,' /       ██╔══██╗██╔══██║██╔═══╝ ██║██║  ██║ • Date : $(Date)   ║
║   ,'  /_____   ██║  ██║██║  ██║██║     ██║██████╔╝                       ║
║ .'____    ,'   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝                        ║
║      /  ,'     ██████╗ ███████╗███████╗ ██████╗ ██╗    ██╗   ██╗███████╗ ║       
║     / ,'       ██╔══██╗██╔════╝██╔════╝██╔═══██╗██║    ██║   ██║██╔════╝ ║
║    /,'         ██████╔╝█████╗  ███████╗██║   ██║██║    ██║   ██║█████╗   ║
║   /'           ██╔══██╗██╔══╝  ╚════██║██║   ██║██║    ╚██╗ ██╔╝██╔══╝   ║
║                ██║  ██║███████╗███████║╚██████╔╝███████╗╚████╔╝ ███████╗ ║
║                ╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚══════╝ ╚═══╝  ╚══════╝ ║
╚══════════════════════════════════════════════════════════════════════════╝" -Color Yellow}
# Unicde chars : ╔ ╗ ╚ ╝ ═ ║ ╠ ╣ ╦ ╩ ╬
# -------------------------------------------------------------------------------------------- #

# -------------------------------------[ Banner_Menu_Main ]----------------------------------- #
function Menu_Main {
    $TITLE = "Main Menu"

    Write-Color "╔$([string]('═' * $width))╗" -Color White
    Write-Color "║$((Center-Text $TITLE $width).PadRight($width))║" -Color White,Red,White
    Write-Color "╚$([string]('═' * $width))╝" -Color White
    Write-Host ""
    Write-Color "║ ", "01", " ║", " Incident Updates (Status)" -Color White, Red, White, White
    Write-Color "║ ", "02", " ║", " Escalation Management" -Color White, Red, White, White
    Write-Host ""
    Write-Color "║ ", "00", " ║", " Exit" -Color White, Red, White, White
}

function Banner_Menu_Main{Clear-Host;Banner;Menu_Main;Write-Host ""}
# -------------------------------------------------------------------------------------------- #

# ---------------------------------[ Banner_Menu_Incident_Status ]---------------------------- #
function Menu_Incident_Status{
    $TITLE = "Incident Updates (Status)"

    Write-Color "╔$([string]('═' * $width))╗" -Color White
    Write-Color "║$((Center-Text $TITLE $width).PadRight($width))║" -Color White,Red,White
    Write-Color "╚$([string]('═' * $width))╝" -Color White
    Write-Host ""
    Write-Color "║ ","01"," ║", " Incident Closure" -Color White, Red, White, White
    Write-Color "║ ","02"," ║", " Request Additional Information" -Color White, Red, White, White
    Write-Color "║ ","03"," ║", " Booking an intervention appointment" -Color White, Red, White, White
    Write-Host ""
    Write-Color "║ ","00"," ║", " Back" -Color White, Red, White, White
    Write-Host ""
}

function Banner_Menu_Incident_Status{Clear-Host;Banner;Menu_Incident_Status}
# -------------------------------------------------------------------------------------------- #

# -----------------------------[ Banner_Menu_Escalation_Management ]-------------------------- #
function Menu_Escalation_Management{
    $TITLE = "Escalation Management"

    Write-Color "╔$([string]('═' * $width))╗" -Color White
    Write-Color "║$((Center-Text $TITLE $width).PadRight($width))║" -Color White,Red,White
    Write-Color "╚$([string]('═' * $width))╝" -Color White
    Write-Host ""
    Write-Color "║ ","01"," ║", " Escalated to Level 2" -Color White, Red, White, White
    Write-Host ""
    Write-Color "║ ","00"," ║", " Back" -Color White, Red, White,White
    Write-Host ""
}
function Banner_Menu_Escalation_Management{Clear-Host;Banner;Menu_Escalation_Management}
# -------------------------------------------------------------------------------------------- #