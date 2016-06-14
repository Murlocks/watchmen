function Notifies {
    param(
        [parameter(Mandatory, Position = 0)]
        [scriptblock]$Script
    )

    begin {
        Write-Debug -Message "Entering: $($PSCmdlet.MyInvocation.MyCommand.Name)"
        Assert-InWatchmen -Command $PSCmdlet.MyInvocation.MyCommand.Name
        $global:Watchmen.InNotifies = $true
    }

    process {
        $global:ThisNotifiers = @()
        $global:ThisNotifiers += . $Script
    }

    end {
        $global:Watchmen.InNotifies = $false
        Write-Debug -Message "Exiting: $($PSCmdlet.MyInvocation.MyCommand.Name)"
    }    
}