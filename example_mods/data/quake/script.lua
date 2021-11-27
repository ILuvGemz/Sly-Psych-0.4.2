
local startDiag = false
function onStartCountdown()
	if not startDiag and isStoryMode and not seenCutscene then
		startVideo('Quake Cutscene');
		startDiag = true;
		return Function_Stop;
	end
	if startDiag and not seenCutscene and isStoryMode then
		startDialogue('dialogue', 'sly3');
		seenCutscene = true;
		return Function_Stop;
	end
	return Function_Continue;
end  