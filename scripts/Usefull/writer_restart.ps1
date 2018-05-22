Clear-Host
$x = 0
$y = 0

$writers = vssadmin list writers | Select-String -Context 0,4 'Writer name:' | ? {$_.Context.PostContext[3].Trim() -ne "Last error: No error"} | Select Line | % {$_.Line.tostring().Split("'")[1]}
$writers_test_before = vssadmin list writers | Select-String -Context 0,4 'Writer name:' | ? {$_.Context.PostContext[3].Trim() -eq "Last error: No error"} | Select Line | % {$_.Line.tostring().Split("'")[1]}

function restart{

 $ServiceNames = $writers | 
    ForEach-Object {
        switch ($_) {
            'ASR Writer' { $Result = 'VSS' }
            'Bits Writer' { $Result = 'BITS'}
             'Certificate Authority' { $Result = 'EventSystem'}
            'COM+ REGDB Writer' { $Result = 'VSS'}
            'DFS Replication service writer' { $Result = 'DFSR'}
            'Dhcp Jet Writer' { $Result = 'DHCPServer'}
            'FRS Writer' { $Result = 'NtFrs' }
            'IIS Config Writer' { $Result = 'AppHostSvc'}
            'IIS Metabase Writer' { $Result = 'IISADMIN'}
            'MSMQ Writer (MSMQ)' {$Result = 'MSMQ'}
            'Microsoft Exchange Writer' { $Result = 'MSExchangeIS'}
            'Microsoft Hyper-V VSS Writer' { $Result = 'vmms'}
            'MS Search Service Writer' { $Result = 'EventSystem'}
            'NPS VSS Writer' { $Result = 'EventSystem'}
            'NTDS' { 'EventSystem'}
            'OSearch VSS Writer' { $Result = 'OSearch'}
            'OSearch14 VSS Writer' { $Result = 'OSearch14'}
            'Registry Writer' { $Result = 'VSS'}
            'Shadow Copy Optimization Writer' { $Result = 'VSS'}
            'Sharepoint Services Writer' { $Result = 'SPWriter'}
            'SPSearch VSS Writer' { $Result = 'SPSearch'}
            'SPSearch4 VSS Writer' { $Result = 'SPSearch4'}
            'SqlServerWriter' { $Result = 'SQLWriter'}
            'System Writer' { $Result = 'CryptSvc'}
            'WMI Writer' { $Result = 'Winmgmt'}
            'TermServLicensing' { $Result = 'TermServLicensing'}
        }
        $result
    }

If ($Result) {
    Restart-Service -Name ($ServiceNames | Select-Object -Unique) -Force -WhatIf
 }
 
$script:writers_after = vssadmin list writers | Select-String -Context 0,4 'Writer name:' | ? {$_.Context.PostContext[3].Trim() -ne "Last error: No error"} | Select Line | % {$_.Line.tostring().Split("'")[1]}
$script:writers_test_after = vssadmin list writers | Select-String -Context 0,4 'Writer name:' | ? {$_.Context.PostContext[3].Trim() -eq "Last error: No error"} | Select Line | % {$_.Line.tostring().Split("'")[1]}
control
}

function control {
if($script:writers_after){
    if($y -eq 3){
    matchtest
    }
    else{
    $script:y = $script:y + 1
    restart
    }
}
}

function matchtest {

if ($script:writers_test_before = $script:writers_test_after) {
}
else{
if ($x -eq 3){
    }
    else{    
    $script:x = $script:x + 1
    restart
    }
}
}
restart