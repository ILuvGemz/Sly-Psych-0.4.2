local allowCountdown = false
local actuallend = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		startDialogue('dialogue', 'sly4');
		allowCountdown = true;
		return Function_Stop;
		end
	return Function_Continue;
	end

	
function onEndSong()
	if isStorymode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('endcutscene', 1);
		seenCutscene = true;
		return Function_Stop;
	end		
	if isStorymode and not actuallend then
		return Function_Stop;
		end
	return Function_Continue;
end


function onTimerCompleted(tag)
	if tag == 'endcutscene' then
		runTimer('endfix', 47.4);
		startVideo('ending');
		end
	
	if tag == 'endfix' then
	actuallend = true
		endSong()
	end
end