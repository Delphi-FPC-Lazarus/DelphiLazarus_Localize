unit Unit1;

interface

uses
  System.UITypes,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.Win.Registry, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

resourcestring
 rsRestart='Bitte Anwendung neu starten';
 rsTestString1='Das ist ein Test';
 rsTestString2='Das ist noch ein Test';

implementation

{$R *.dfm}

uses localize_unit;

procedure TForm1.Button1Click(Sender: TObject);
begin
  messagedlg(rsTestString1, mtinformation, [mbok], 0);
  messagedlg(rsTestString2, mtconfirmation, [mbyes]+[mbno], 0);
  messagedlg(rsTestString2, mtwarning, [mbAbort]+[mbRetry], 0);
  messagedlg(rsTestString2, mtconfirmation, [mbAbort]+[mbOK], 0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  showmessage(getApplicationLanguage(application.ExeName));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SetApplicationLanguage(application.ExeName, 'DE');
  Showmessage(rsRestart);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SetApplicationLanguage(application.ExeName, 'EN');
  Showmessage(rsRestart);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ResetApplicationLanguage(Application.ExeName);
  Showmessage(rsRestart);
end;

end.
