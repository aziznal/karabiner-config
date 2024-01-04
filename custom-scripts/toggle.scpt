-- This script is used to start an application if it is not running, or to
-- bring it to the front if it is running but not the frontmost application.
on run argv
  set appName to item 1 of argv
  set startIt to false
  tell application "System Events"
    if not (exists process appName) then
      set startIt to true
    else if frontmost of process appName then
      set visible of process appName to false
    else
      set frontmost of process appName to true
    end if
  end tell
  if startIt then
    tell application appName to activate
  end if
end run
