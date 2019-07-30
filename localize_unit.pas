{
  Anwendungssprache lesen/schreiben/umschalten

  Diese Unit funktion mit unter Windows mit Delphi sowie unter Lazarus LCLtranslator, auch unter Linux.
  Ein freies geeigneten Übersetzungsprogrammen ist LinLocalize "WinLocalize"
  https://sourceforge.net/projects/winlocalize/
  Diess kann auch die PO Dateien für i18n erzeugen.

  Die Eingestellte Sprache wird automatisch von
  System / InternalGetLocaleOverride (Delphi) gelesen und
  - sofern ressourcendatei für die entsprechende Sprache vorhanden - geladen.
  WARNUNG: Ressourcendateien für andere Sprachen <anwendung>.<Sprache> (z.B. Test_units_localize.EN)
  müssen nach dem Recompile der Awendung unbdingt neu erzeugt werden damit diese wieder
  mit der Anwendung zusammenpasst!

  Unter Lazarus muss im Projekt, am besten vor Application.Initialize,
  SwitchUILanguage(application.exename) aufgerufen werden.

  02/2016 XE10 x64 Test
  xx/xxxx FPC Ubuntu

  --------------------------------------------------------------------
  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at https://mozilla.org/MPL/2.0/.

  THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTY

  Author: Peter Lorenz
  Is that code useful for you? Donate!
  Paypal webmaster@peter-ebe.de
  --------------------------------------------------------------------

}

{$I ..\share_settings.inc}
unit localize_unit;

interface

uses
{$IFDEF FPC}
  LCLIntf, LCLType, LMessages, LCLtranslator,
  Messages, SysUtils, Variants, Classes, Registry,
  Graphics, Controls, Forms, Dialogs;
{$ELSE}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Win.Registry,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
{$ENDIF}
function GetApplicationLanguage(sApplication: String): String;
procedure SetApplicationLanguage(sApplication, sLanguage: String);
procedure ResetApplicationLanguage(sApplication: String);

{$IFDEF UNIX}
procedure SwitchUILanguage(sApplication: String);
{$ENDIF}

implementation

const
  sLocalizeRegKey: String = 'Software\Embarcadero\Locales\';

function GetApplicationLanguage(sApplication: String): String;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.Access := KEY_READ;
    Reg.OpenKey(sLocalizeRegKey, True);
    Result := Reg.ReadString(sApplication);
  finally
    Reg.CloseKey();
    FreeAndNil(Reg);
  end;
end;

procedure ResetApplicationLanguage(sApplication: String);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.Access := KEY_WRITE;
    Reg.OpenKey(sLocalizeRegKey, True);
    Reg.DeleteValue(sApplication);
  finally
    Reg.CloseKey();
    FreeAndNil(Reg);
  end;
end;

procedure SetApplicationLanguage(sApplication, sLanguage: String);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.Access := KEY_WRITE;
    Reg.OpenKey(sLocalizeRegKey, True);
    Reg.WriteString(sApplication, sLanguage);
  finally
    Reg.CloseKey();
    FreeAndNil(Reg);
  end;
end;

{$IFDEF UNIX}

function GetDefaultLanguage: string;
var
  sLanguage: string;
begin
  Result := '';
  sLanguage := GetEnvironmentVariable('LANG');
  if length(sLanguage) >= 2 then
  begin
    Result := copy(sLanguage, 1, 2);
  end;
end;

procedure SwitchUILanguage(sApplication: String);
var
  sLanguage: string;
begin
  // Eingestellte Sprache
  sLanguage := trim(GetApplicationLanguage(sApplication));
  // sonst Default Sprache, wobei bei Defaultsprache <> de/en auf en gestellt wird.
  if length(sLanguage) < 1 then
  begin
    sLanguage := GetDefaultLanguage; // nicht getdefaultlang
    if (LowerCase(sLanguage) <> 'de') and (LowerCase(sLanguage) <> 'en') then
    begin
      sLanguage := 'en';
    end;
  end;

  // Sprache setzen wenn ermittelt und nicht da die ja integriert ist
  // i18n muss aktiv sein, es prüft eigenständig ob eine Übersetzungsdatei vorliegt
  if (length(sLanguage) > 0) and (LowerCase(sLanguage) <> 'de') then
  begin
    SetDefaultLang(LowerCase(sLanguage));
  end;
end;
{$ENDIF}

end.
