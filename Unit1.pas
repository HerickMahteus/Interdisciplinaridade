unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Grids, FireDAC.Phys.PGDef,
  FireDAC.Phys.PG;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    StringGrid1: TStringGrid;
    FDTable1: TFDTable;
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Registro : TBookmark;
begin
  Registro := FDTable1.GetBookmark;
  FDTable1.Close;
  FDConnection1.Close;
  FormShow(Form1);
  FDTable1.GotoBookmark(Registro);
end;

procedure TForm1.Button2Click(Sender: TObject);
var vSQL : String;
    Registro : TBookmark;
begin
   vSQL := 'update clientes set nome_cliente = '+QuotedStr( Edit2.Text )+', limite_credito = '+ F(TEdit3.Text)+' where idcliente = '+TEdit1.Text;
   try
     FDConnection.ExecSQL('SET lock_timeout = ''3s''');
     FDConnection.StartTransaction;
     FDQuery2.Close;
     FDQuery2.SQL.Text := 'select * from clientes where idcliente = '+DBEdit1.Text;
     FDQuery2.Open;

     if (FDQuery2.FieldByName('nome_cliente').Value = FDTable1.FieldByName('nome_cliente').OldValue) and
        (FDQuery2.FieldByName('limite_credito').Value = FDTable1.FieldByName('limite_credito').OldValue) then
     begin
       FDQuery1.Close;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Text := vSQL;
       FDQuery1.ExecSQL;
       if (MessageDlg('Dados alterados confirmar?', mtConfirmation, [mbYes, mbNo], 0)=mrYes) then
         FDConnection.Commit
       else
         FDConnection.Rollback;
     end;
     else
       MessageDlg('Versão dos dados errada, atualize primeiro.', mtInformation, [mbOK], 0)
   except
     on E:Exception do
     begin
       FDConnection.Rollback;
       if (Pos('lock timeout',e.Message)>0) then
         MessageDlg('Registro está sendo alterado por outro usuário, tente mais tarde!', mtInformation, [mbOK], 0)
       else
         MessageDlg('Erro: Ocorreu um problema ao processar a transação. Detalhes: '#13+e.Message, mtError, [mbOK], 0);
     end;
   end;
   Registro := FDTable1.GetBookmark;
   FDTable1.Cancel;
   FDTable1.Close;
   FDTable1.Open;
   FDTable1.GotoBookmark(Registro);
end;

function TForm1.F(Value: String): String;
var v : Extended;
begin
  v := StrToFloatDef(Value,0);
  Result := StringReplace(FormatFloat('0.00',v),',','.',[rfReplaceAll]);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FDConnection.Open;
  FDTable1.Open;
end;

end.
