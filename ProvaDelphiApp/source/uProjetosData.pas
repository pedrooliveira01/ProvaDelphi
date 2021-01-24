unit uProjetosData;

interface

uses
  Data.DB, Datasnap.DBClient;

type TProjetoData = class
  private
    FDataSource: TDataSource;
    FClientDataSet: TClientDataSet;
    procedure CreateFields;
  public
    property DataSource: TDataSource read FDataSource write FDataSource;
    property ClientDataSet: TClientDataSet read FClientDataSet write FClientDataSet;
    constructor Create;
    Destructor Destroy; override;
    procedure PopulateData;
    function GetTotal: Currency;
    function GetTotalDivisoes: Currency;
end;

implementation

uses
  System.Classes, System.SysUtils, System.Math;

{ TProjetoData }

constructor TProjetoData.Create;
begin
  FClientDataSet := TClientDataSet.Create(nil);
  FDataSource := TDataSource.Create(nil);
  FDataSource.DataSet := FClientDataSet;
  CreateFields;
end;

procedure TProjetoData.CreateFields;
var aTotalAgg : TAggregate;
begin
  FClientDataSet.FieldDefs.Add('idProjeto',ftInteger);
  FClientDataSet.FieldDefs.Add('NomeProjeto',ftString, 120);
  FClientDataSet.FieldDefs.Add('Valor',ftCurrency);
  FClientDataSet.AggregatesActive := True;

  aTotalAgg := FClientDataSet.Aggregates.Add;
  aTotalAgg.AggregateName := 'Total';
  aTotalAgg.Expression := 'sum(Valor)';
  aTotalAgg.Active := true;

  FClientDataSet.CreateDataSet;
  FClientDataSet.Open;
end;

destructor TProjetoData.Destroy;
begin
  FClientDataSet.Close;
  FDataSource.Free;
  FClientDataSet.Free;
  inherited;
end;

function TProjetoData.GetTotal: Currency;
begin
  result := RoundTo( FClientDataSet.aggregates[0].value, -2);
end;

function TProjetoData.GetTotalDivisoes: Currency;
var aTemp : Currency;
begin
  result := 0;
  FClientDataSet.First;
  while not FClientDataSet.eof do
  Begin
    aTemp :=  FClientDataSet.Fields[2].ascurrency;
    FClientDataSet.next;
    if not FClientDataSet.eof then
      result := result + ( FClientDataSet.Fields[2].ascurrency / aTemp );
  End;

  Result := RoundTo( result, -2);

end;

procedure TProjetoData.PopulateData;
var
  I: Integer;
begin
  FClientDataSet.EmptyDataSet;
  for I := 1 to 10 do
    FClientDataSet.AppendRecord([i, 'Projeto '+i.ToString, 10 * (1+random(20)) ])
end;

end.
