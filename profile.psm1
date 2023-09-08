$thisDirectory = (Split-Path -parent $MyInvocation.MyCommand.Definition);

function Use-Peerflix {
	Param(
		[parameter(ValueFromRemainingArguments = $true)]
		[string[]]$Passthrough
	)
	
	$prevNodeVer = (& nvm current)
	
	if($prevNodeVer -ne "v18.16.0") {
		& nvm use "v18.16.0"
	}
	
	& node $thisDirectory\app.js -f $thisDirectory\cache @Passthrough
	
	if($prevNodeVer -ne "v18.16.0") {
		& nvm use $prevNodeVer
	}
}

Set-Alias peerflix Use-Peerflix
Export-ModuleMember -Alias peerflix -Function 'Use-Peerflix';
