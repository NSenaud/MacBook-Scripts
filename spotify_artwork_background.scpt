-- Set Paths
set ArtworkFromSpotify to ((path to home folder) as text) & "Documents:Dev:AppleScript:Spotify:albumArtwork.tiff"

-- Set Variable
set isPlaying to null

repeat
  if application "Spotify" is running then
		tell application "Spotify"
			if player state is playing then
				set isPlaying to yes
				set theTrack to current track
				set theTrackArtwork to null
				set theTrackArtwork to artwork of theTrack
				
				set fileRef to (open for access ArtworkFromSpotify with write permission)
				
				try
					write theTrackArtwork to fileRef
					close access fileRef
				on error errorMsg
					try
						close access fileRef
					end try
					errorMsg
				end try
			else
				set isPlaying to no
			end if
		end tell
	end if
	
	tell application "Finder"
		if isPlaying is yes then
			set desktop picture to {((path to home folder) as text) & "Documents:Dev:AppleScript:Spotify:albumArtwork.tiff"} as alias
		else
			set desktop picture to {((path to home folder) as text) & "Pictures:Alizée:_DSC8998.NEF_IEAJPW.jpg"}
		end if
	end tell
	delay 10
end repeat
