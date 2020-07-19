
InModuleScope Watchmen {

    describe 'When' {

        context 'In WatchmenOptions' {

            # Pester (pre-v5?) aliases 'when' which clashes with watchmen\when
            If (Test-Path Alias:When) { 
                Remove-Item Alias:When 
            }

            Mock -CommandName Assert-InWatchmen -MockWith {}

            BeforeEach {
                $script:watchmen = @{
                    InConfig = $true
                    InTest = $false
                    InNotifies = $true
                    Options = @{
                        NotifierConditions = @{
                            WatchmenOptions = 'OnFailure'
                            WatchmenTest = 'OnFailure'
                        }
                    }
                }
            }

            it 'Sets the default notifier condition to [OnFailure]' {
                When 'OnFailure'
                $script:Watchmen.Options.NotifierConditions.WatchmenOptions | should -be 'Onfailure'
                $script:Watchmen.Options.NotifierConditions.WatchmenTest | should -be 'Onfailure'
            }

            it 'Sets the default notifier condition to [OnSuccess]' {
                When 'OnSuccess'
                $script:Watchmen.Options.NotifierConditions.WatchmenOptions | should -be 'OnSuccess'
                $script:Watchmen.Options.NotifierConditions.WatchmenTest | should -be 'OnSuccess'
            }

            it 'Sets the default notifier condition to [Always]' {
                When 'Always'
                $script:Watchmen.Options.NotifierConditions.WatchmenOptions | should -be 'Always'
                $script:Watchmen.Options.NotifierConditions.WatchmenTest | should -be 'Always'
            }
        }

        context 'In WatchmenTest' {

            Mock -CommandName Assert-InWatchmen -MockWith {}

            BeforeEach {
                $script:watchmen = @{
                    InConfig = $false
                    InTest = $true
                    InNotifies = $true
                    Options = @{
                        NotifierConditions = @{
                            WatchmenOptions = 'OnFailure'
                            WatchmenTest = 'OnFailure'
                        }
                    }
                }
            }

            it 'Sets the default notifier condition to [OnFailure]' {
                When 'OnFailure'
                $script:Watchmen.Options.NotifierConditions.WatchmenTest | should -be 'Onfailure'
            }

            it 'Sets the default notifier condition to [OnSuccess]' {
                When 'OnSuccess'
                $script:Watchmen.Options.NotifierConditions.WatchmenTest | should -be 'OnSuccess'
            }

            it 'Sets the default notifier condition to [Always]' {
                When 'Always'
                $script:Watchmen.Options.NotifierConditions.WatchmenTest | should -be 'Always'
            }
        }
    }
}
