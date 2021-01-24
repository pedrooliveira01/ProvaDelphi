unit uTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMdiForm, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uProjetosData;

type
  TufTarefa3 = class(TufMdiForm)
    lblTituloGrid: TLabel;
    DBG: TDBGrid;
    btnObterTotal: TButton;
    btnObterTotalDivisoes: TButton;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnObterTotalClick(Sender: TObject);
    procedure btnObterTotalDivisoesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FProjeto : TProjetoData;
  end;

var
  ufTarefa3: TufTarefa3;

implementation

{$R *.dfm}

procedure TufTarefa3.btnObterTotalClick(Sender: TObject);
begin
  inherited;
  edtTotal.text := FormatCurr('#0.00',FProjeto.GetTotal);
end;

procedure TufTarefa3.btnObterTotalDivisoesClick(Sender: TObject);
begin
  inherited;
  edtTotalDivisoes.text := FormatCurr('#0.00',FProjeto.GetTotalDivisoes);
end;

procedure TufTarefa3.FormCreate(Sender: TObject);
begin
  inherited;
  FProjeto := TProjetoData.Create;
  DBG.DataSource := FProjeto.DataSource;
  FProjeto.PopulateData;
end;

procedure TufTarefa3.FormDestroy(Sender: TObject);
begin
  inherited;
  FProjeto.Free;
end;

end.
