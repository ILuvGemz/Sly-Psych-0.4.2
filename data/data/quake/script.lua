local allowCountdown = false
local startDiag = true
function onStartCountdown()
	if not allowCountdown and not startDiag and isStoryMode and not seenCutscene then
		startVideo('Quake Cutscene');
		startDiag = true;
		return Function_Stop;
	end
	if startDiag and not allowCountdown and isStoryMode then
		startDialogue('dialogue', 'sly3');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end  