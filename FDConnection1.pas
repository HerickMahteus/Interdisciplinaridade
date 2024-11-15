unit FDConnection1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client;

type
  TFDConnection1 = class(TFDConnection)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TFDConnection1]);
end;

end.
