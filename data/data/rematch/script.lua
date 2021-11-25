local allowCountdown = false
local startDiag = false
function onStartCountdown()
	if not allowCountdown and not startDiag and isStoryMode and not seenCutscene then
		startVideo('Dreamatch Opening');
		startDiag = true;
		return Function_Stop;
	end
	if startDiag and not allowCountdown then
		startDialogue('dialogue', '');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end  