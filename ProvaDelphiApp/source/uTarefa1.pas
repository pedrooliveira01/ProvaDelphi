unit uTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.DApt, FireDAC.Phys, FireDAC.Phys.SQLite, uMdiForm;

type
  TufTarefa1 = class(TufMdiForm)
    memoColunas: TMemo;
    memoTabelas: TMemo;
    memoCondicoes: TMemo;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    btnGeraSQL: TButton;
    memoSQL: TMemo;
    lblSQL: TLabel;
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Clear;
    function GeraSQL: string;
  end;

var
  ufTarefa1: TufTarefa1;

implementation

uses uspQuery;

{$R *.dfm}

procedure TufTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  memoSQL.Lines.Clear;
  memoSQL.Lines.Add(GeraSQL);
end;

procedure TufTarefa1.Clear;
begin
  memoColunas.lines.Clear;
  memoTabelas.lines.Clear;
  memoCondicoes.lines.Clear;
  memoSQL.lines.Clear;
end;

procedure TufTarefa1.FormCreate(Sender: TObject);
begin
  inherited;
  Clear;
end;

function TufTarefa1.GeraSQL: string;
var aspQuery : TspQuery;
  I: Integer;
begin
  aspQuery := TspQuery.Create(self);

  for I := 0 to memoColunas.lines.count-1 do
    aspQuery.spColunas.Add(memoColunas.lines[i]);

  for I := 0 to memoTabelas.lines.count-1 do
    aspQuery.spTabelas.Add(memoTabelas.lines[i]);

  for I := 0 to memoCondicoes.lines.count-1 do
    aspQuery.spCondicoes.Add(memoCondicoes.lines[i]);


  aspQuery.GeraSQL;

  result := aspQuery.SQL.Text;
end;

end.
