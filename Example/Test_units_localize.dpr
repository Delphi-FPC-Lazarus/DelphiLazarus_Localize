program Test_units_localize;

//FastMM4 in '..\..\_Share\extern\FastMM\FastMM4.pas',
//FastMM4Messages in '..\..\_Share\extern\FastMM\FastMM4Messages.pas',

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},

  localize_unit in '..\localize_unit.pas';

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown:= true;
  {$ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
