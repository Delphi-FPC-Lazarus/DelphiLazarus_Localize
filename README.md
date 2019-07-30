# DelphiLazarus_Localize
Switch application language (system.InternalGetLocaleOverride / i18n)

## What it is 
  This unit works under Windows with Delphi and under Lazarus LCLtranslator, also under Linux.
  
  A free suitable translation program is LinLocalize "WinLocalize".
  https://sourceforge.net/projects/winlocalize/
  This can also create the PO files for i18n.

  Selected language is automatically set by
  System / InternalGetLocaleOverride (Delphi)
  if a resource file exists for the corresponding language.
  WARNING: resource files for other languages <application>.<language> (e.g. Test_units_localize.EN)
  must be recreated after the recompile of the application, it need to fit with application!

  Under Lazarus, preferably before Application.Initialize,
  SwitchUILanguage(application.exename), should be called.


Translated with www.DeepL.com/Translator
# You found the code useful? Donate!

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=DZUZXE2WCJU4U)


