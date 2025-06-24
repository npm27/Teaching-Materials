<?php
    if (!isset($text) || $text === '') { 
        $text = 'How likely are you to correctly recall the ROOM associated with this object?|Type your response on a scale from 0-100 and then press Enter.';
    }

    $texts = explode('|', $text);
    $mainText = array_shift($texts);
?>

<div class="textcenter">
    <div><?php echo isset($text) ? $text : ""; ?></div>

<br>

<div class="study2">
    <span class="study2-left"   ><?php echo $cue;    ?></span>
    <span class="study2-divider"><?php echo "in the";     ?></span>
    <span class="study2-right"  ><?php echo $answer; ?></span>
    <br>

<br>
  
<div class="textcenter">
    <input name="JOL" type="text" value="" autocomplete="off" class="forceNumeric textcenter collectorInput">
    <button class="collectorButton" id="FormSubmitButton">Submit</button>
</div>
