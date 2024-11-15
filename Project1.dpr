program Project1;

uses
  Vcl.Forms,
  DBGrid1 in 'DBGrid1.pas',
  FDConnection1 in 'FDConnection1.pas',
  FDQuery1 in 'FDQuery1.pas',
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
