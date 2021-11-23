package;

import GameJolt.GameJoltAPI;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
//import io.newgrounds.NG;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class GalleryState extends MusicBeatState
{
	var curSelected:Int = 0;

	var newInput:Bool = true;
	var galleryart:FlxSprite;
	var gallerytext:FlxText;
	var rightarrow:FlxSprite;
	var leftarrow:FlxSprite;

	override function create()
	{
		FlxG.sound.music.stop();

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/gallerybg'));
		bg.setGraphicSize(Std.int(bg.width * 0.67));
		bg.updateHitbox();
		bg.antialiasing = true;
		add(bg);

		leftarrow = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/leftarrow'));
		leftarrow.setGraphicSize(Std.int(leftarrow.width * 0.67));
		leftarrow.updateHitbox();
		leftarrow.antialiasing = true;
		add(leftarrow);

		rightarrow = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/rightarrow'));
		rightarrow.setGraphicSize(Std.int(rightarrow.width * 0.67));
		rightarrow.updateHitbox();
		rightarrow.antialiasing = true;
		add(rightarrow);

		var escapetext:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/escapetext'));
		escapetext.setGraphicSize(Std.int(escapetext.width * 0.67));
		escapetext.updateHitbox();
		escapetext.antialiasing = true;
		add(escapetext);

		var gallerytextbox:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/gallerytextbox'));
		gallerytextbox.setGraphicSize(Std.int(gallerytextbox.width * 0.67));
		gallerytextbox.updateHitbox();
		gallerytextbox.antialiasing = true;
		add(gallerytextbox);

		// NG.core.calls.event.logEvent('swag').send();

		galleryart = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/galleryart0'));
		galleryart.setGraphicSize(Std.int(galleryart.width * 0.67));
		galleryart.updateHitbox();
		add(galleryart);

		gallerytext = new FlxText(0, 0, FlxG.width, "", 64);
		
			gallerytext.setFormat(Paths.font("bubblegum.otf"), 64, CENTER);
			gallerytext.screenCenter(X);
			gallerytext.y = 620;
			add(gallerytext);

		changeItem();

		super.create();
	}

	var inCutscene:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		if (curSelected ==  10 || curSelected == 15 || curSelected == 19 || curSelected == 11 || curSelected == 8 || curSelected == 18 || curSelected == 27)
			FlxG.mouse.visible = true;
		else
			FlxG.mouse.visible = false;

		if (!inCutscene)
		{
			if (FlxG.mouse.pressed)
		{
			switch (curSelected)
			{
				case 8:
				FlxG.save.data.sly2 = true;
			PlayState.isStoryMode = false;

			var poop:String = Highscore.formatSong('Sly', 2);

			PlayState.SONG = Song.loadFromJson(poop, 'sly');
			PlayState.storyDifficulty = 2;
			PlayState.campaignScore = 0;
			LoadingState.loadAndSwitchState(new PlayState(), true);	

				case 19:
				inCutscene = true;
			var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
			bg.scrollFactor.set();
			add(bg);

			(new FlxVideo(Paths.modFolders('videos/mattslyteaser' + '.' + Paths.VIDEO_EXT))).finishCallback = function() {
				remove(bg);
				inCutscene = false;
			}
			return;

				case 18:
				curSelected = 17;
				CoolUtil.browserLoad('https://soundcloud.com/samthesly/sets/vs-sly-remastered-soundtrack');

				case 10:
			inCutscene = true;
			var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
			bg.scrollFactor.set();
			add(bg);

			(new FlxVideo(Paths.modFolders('videos/recording1' + '.' + Paths.VIDEO_EXT))).finishCallback = function() {
				remove(bg);
				inCutscene = false;
			}
			return;
				case 15:
			inCutscene = true;
			var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
			bg.scrollFactor.set();
			add(bg);

			(new FlxVideo(Paths.modFolders('videos/recording2' + '.' + Paths.VIDEO_EXT))).finishCallback = function() {
				remove(bg);
				inCutscene = false;
			}
				case 27:
			inCutscene = true;
			var bg = new FlxSprite(-FlxG.width, -FlxG.height).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
			bg.scrollFactor.set();
			add(bg);

			(new FlxVideo(Paths.modFolders('videos/recording3' + '.' + Paths.VIDEO_EXT))).finishCallback = function() {
				remove(bg);
				inCutscene = false;
			}
				case 11:
				PlayState.isStoryMode = false;

			var poop:String = Highscore.formatSong('Roger', 2);

			PlayState.SONG = Song.loadFromJson(poop, 'roger');
			PlayState.storyDifficulty = 2;
			PlayState.campaignScore = 0;
			GameJoltAPI.getTrophy(150850);
			FlxG.save.data.roger = true;
			LoadingState.loadAndSwitchState(new PlayState(), true);	

			default:

			}
		}


			if (controls.UI_LEFT_P)
			{
				leftarrow.x -= 5;
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				leftarrow.x += 5;
			});
			}

			if (controls.UI_RIGHT_P)
			{
				rightarrow.x += 5;
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
				new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				rightarrow.x -= 5;
			});
			}

			if (controls.BACK)
			{
				FlxG.switchState(new MainMenuState());
			}
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= 44)
			curSelected = 0;
		if (curSelected <= -1)
			curSelected = 43;

		remove(galleryart);
		galleryart = new FlxSprite(0, 0).loadGraphic(Paths.image('gallery/galleryart' + curSelected));
		galleryart.setGraphicSize(Std.int(galleryart.width * 0.67));
		galleryart.updateHitbox();
		add(galleryart);

		switch (curSelected)
		{
			case 0:
			gallerytext.text = "First Sly Art (2015)";

			case 1:
			gallerytext.text = "Original Sly Sprite Sketch";

			case 2:
			gallerytext.text = "VS Sly Main Sly Artwork";

			case 3:
			gallerytext.text = "Quake Sly Art";

			case 4:
			gallerytext.text = "Sly Defeated";

			case 5:
			gallerytext.text = "Loading Screen Sly";

			case 6:
			gallerytext.text = "Dreammatch Sly Art";

			case 7:
			gallerytext.text = "Sly Sleeping";

			case 8:
			gallerytext.text = "VS Sly 2 Sly";

			case 9:
			gallerytext.text = "VS Sly 2 Boyfriend";

			case 10:
			gallerytext.text = "VS Sly 2 Hoodie Guy";

			case 11:
			gallerytext.text = "VS Roger Art";

			case 12:
			gallerytext.text = "Sly Art by @Sulraye";

			case 13:
			gallerytext.text = "Sly Art by @CryoGX";

			case 14:
			gallerytext.text = "Dreamatch Sly Sketch";

			case 15:
			gallerytext.text = "Hoodie Guy Sketch";

			case 16:
			gallerytext.text = "Nightmare Sly Main Art";

			case 17:
			gallerytext.text = "EMFNF2 Graffiti Contest Submission";

			case 18:
			gallerytext.text = "VS Sly Album [Click for Link]";

			case 19:
			gallerytext.text = "Sly (Friday Night Fisticuffs)";

			case 20:
			gallerytext.text = "BG Characters (Left)";

			case 21:
			gallerytext.text = "BG Characters (Right)";

			case 22:
			gallerytext.text = "VS Sly 10K Special Art";

			case 23:
			gallerytext.text = "Sly Had to do it to 'Em";

			case 24:
			gallerytext.text = "Sly Art by @Acronorth";

			case 25:
			gallerytext.text = "Sly Art by @Bit5000";
			
			case 26:
			gallerytext.text = "Sly Art by @BreadpireDr";

			case 27:
			gallerytext.text = "Sly and Hoodie Guy";

			case 28:
			gallerytext.text = "Sly Art by @loheckle1";
			
			case 29:
			gallerytext.text = "Sly Art by @MauricioYT81052";

			case 30:
			gallerytext.text = "Sly Art by @osh_wott";

			case 31:
			gallerytext.text = "Sly Art by @san_matrix";
			
			case 32:
			gallerytext.text = "Sly Art by @salty_saltinator";

			case 33:
			gallerytext.text = "Sly Art by @qt_kota";

			case 34:
			gallerytext.text = "Sly Art by @ScottTheScatty";

			case 35:
			gallerytext.text = "Sly and Vidz";
			case 36:
			gallerytext.text = "Sly Head Icon";
			case 37:
			gallerytext.text = "Sly Night Sky Wallpaper";
			case 38:
			gallerytext.text = "Slyception BG (Left)";
			case 39:
			gallerytext.text = "Slyception BG (Right)";
			case 40:
			gallerytext.text = "Sly Art by @Smudgeepicly";
			case 41:
			gallerytext.text = "Sly Art by @RasulNaji";
			case 42:
			gallerytext.text = "Sly Art by @eratorator";
			case 43:
			gallerytext.text = "Sly Art by @NozomyNikonight";
		}
	}
}