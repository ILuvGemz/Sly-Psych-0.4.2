local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not seenCutscene and isStoryMode then
		startDialogue('dialogue', 'sly1');
		allowCountdown = true;
		return Function_Stop;
		end
	return Function_Continue;
	end
