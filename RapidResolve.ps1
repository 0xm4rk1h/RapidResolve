<#
#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-#
# Author        : 0xm4rk1h                                                                                                                                    #
# Name          : RapidResolve                                                                                                                                #
# Date          : 2026-06                                                                                                                                     #
# Version       : 1.0.0                                                                                                                                       #
# OS            : Windows                                                                                                                                     #
# Language      : PowerShell                                                                                                                                  #
# Description   : A console that enables Help Desk technicians to quickly access standardized message templates for incident ticket handling                  #
# Execution     : powershell -ExecutionPolicy Bypass -File ".\RapidResolve.ps1"                                                                               #
#-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-#
#>

# ----------------------------------------[ Files import ]------------------------------------ #
. ".\ASSETS\FUNCTIONS\FUNCTIONS.ps1"
. ".\ASSETS\MESSAGES\MESSAGES.ps1"
# -------------------------------------------------------------------------------------------- #

# -------------------------------------[ Window Customization ]------------------------------- #
$Host.UI.RawUI.BackgroundColor = "Black" 
$Host.UI.RawUI.WindowTitle = "RapidResolve | By 0xm4rk1h"
# -------------------------------------------------------------------------------------------- #

# -------------------------------------------[ Menu_Main ]------------------------------------ #
Banner_Menu_Main 

do {
    Write-Host "➤ " -NoNewline
    $MENU_MAIN_INPUT = Read-Host

    try{
        if($MENU_MAIN_INPUT -eq ""){Banner_Menu_Main} 

        elseif($MENU_MAIN_INPUT -eq "00" -or $MENU_MAIN_INPUT -eq "0"){exit}

        # --------------------------[ Menu_Incident_Status ]---------------------------------- #
        elseif($MENU_MAIN_INPUT -eq "01" -or $MENU_MAIN_INPUT -eq "1")
        {
            Banner_Menu_Incident_Status

            do{ 
                Write-Host "➤ " -NoNewline
                $MENU_INCIDENT_STATUS_INPUT = Read-Host

                if($MENU_INCIDENT_STATUS_INPUT -eq ""){Banner_Menu_Incident_Status}

                elseif($MENU_INCIDENT_STATUS_INPUT -eq "00" -or $MENU_INCIDENT_STATUS_INPUT -eq "0"){Banner_Menu_Main;break}

                elseif($MENU_INCIDENT_STATUS_INPUT -eq "01" -or $MENU_INCIDENT_STATUS_INPUT -eq "1"){Banner_Menu_Incident_Status;Message_Incident_Closure}  

                elseif($MENU_INCIDENT_STATUS_INPUT -eq "02" -or $MENU_INCIDENT_STATUS_INPUT -eq "2"){Banner_Menu_Incident_Status;Message_Request_Additional_Information}

                elseif($MENU_INCIDENT_STATUS_INPUT -eq "03" -or $MENU_INCIDENT_STATUS_INPUT -eq "3")
                {
                    Banner_Menu_Incident_Status 
                    
                    try{
                        $INCIDENT = Read-Host "║ ?? ║ Incident reference (INCXXXXXX)"
                        $APPOINTMENT_DATE = Read-Host "║ ?? ║ Appointment Date (format - dd/mm/yyyy)"
                        $APPOINTMENT_TIME = Read-Host "║ ?? ║ Appointment Time (format - HH:mm)"
                        $APPOINTMENT_DURATION = Read-Host "║ ?? ║ Appointment duration (format - mm)"
                        $TIME_DATETIME = [datetime]::ParseExact($APPOINTMENT_TIME, 'HH:mm', $null)
                        $APPOINTMENT_DURATION_ADD_TIME = $TIME_DATETIME.addMinutes($APPOINTMENT_DURATION)
                        $MESSAGE = "Dear User, 

We confirm the appointment booking regarding your incident $INCIDENT. 
We will contact you via Microsoft Teams or Phone to carry out an intervention on $APPOINTMENT_DATE between $APPOINTMENT_TIME and $($APPOINTMENT_DURATION_ADD_TIME.ToString('HH:mm')). 

Kind regards, 
Service Desk."
                    Write-Host ""
                    Write-Color $MESSAGE -Color White
                    Write-Host ""              
                    }catch{
                        Write-Host ""
                        Write-Host "[!] Invalid format." -ForegroundColor Red
                        Write-Host ""}   
                }

                else{Write-Host " [!] Invalid option." -ForegroundColor Red}
                
            }while ($MENU_INCIDENT_STATUS_INPUT -ne "exit")
        }
        # ------------------------------------------------------------------------------------ #

        # --------------------------[ Menu_Escalation_Management ]---------------------------- #
        elseif($MENU_MAIN_INPUT -eq "02" -or $MENU_MAIN_INPUT -eq "2")
        {
            Banner_Menu_Escalation_Management
            
            do{
                Write-Host "➤ " -NoNewline
                $MENU_ESCALATION_MANAGEMENT_INPUT = Read-Host

                if($MENU_ESCALATION_MANAGEMENT_INPUT -eq ""){Banner_Menu_Escalation_Management} 

                elseif($MENU_ESCALATION_MANAGEMENT_INPUT -eq "00" -or $MENU_ESCALATION_MANAGEMENT_INPUT -eq "0"){Banner_Menu_Main;break}

                elseif($MENU_ESCALATION_MANAGEMENT_INPUT -eq "01" -or $MENU_ESCALATION_MANAGEMENT_INPUT -eq "1"){Banner_Menu_Escalation_Management;Message_Escalated_to_Level_2}  

                else{Write-Host " [!] Invalid option." -ForegroundColor Red}

            }while ($MENU_ESCALATION_MANAGEMENT_INPUT -ne "exit")
        }
        # ------------------------------------------------------------------------------------ #

        else{Write-Host " [!] Invalid option." -ForegroundColor Red}
    }catch{Write-Host " [!] Erreur [!]" -ForegroundColor Red}
} while ($MENU_MAIN_INPUT -ne "exit")
# -------------------------------------------------------------------------------------------- #