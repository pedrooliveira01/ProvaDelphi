unit uTestfTarefa3;

interface
uses
  DUnitX.TestFramework, uTarefa3;

type

  [TestFixture]
  TTestfTarefa3 = class(TObject)
  private
    FTestTarefa3 : TufTarefa3;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestButtons;
  end;

implementation

uses uProjetosData, System.SysUtils, System.Classes;

procedure TTestfTarefa3.Setup;
begin
  FTestTarefa3 := TufTarefa3.Create(nil);
end;

procedure TTestfTarefa3.TearDown;
begin
  FTestTarefa3.Free;
end;

procedure TTestfTarefa3.TestButtons;
var aEsperado : String;
  I: Integer;
begin
  FTestTarefa3.FProjeto.ClientDataSet.EmptyDataSet;

  for I := 1 to 10 do
    FTestTarefa3.FProjeto.ClientDataSet.AppendRecord([i, 'Projeto '+i.ToString, 10 * i ]);

  aEsperado := FormatCurr('0.00',550);
  FTestTarefa3.btnObterTotalClick(nil);
  Assert.isTrue(FTestTarefa3.edtTotal.text = aEsperado,'GetTotal Esperado: ['+ aEsperado +']' + ' Gerado: ['+ FTestTarefa3.edtTotal.text +']');

  aEsperado := FormatCurr('0.00',11.83);
  FTestTarefa3.btnObterTotalDivisoesClick(nil);
  Assert.isTrue(FTestTarefa3.edtTotalDivisoes.text = aEsperado,'GetTotal Esperado: ['+ aEsperado +']' + ' Gerado: ['+ FTestTarefa3.edtTotalDivisoes.text +']');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestfTarefa3);
end.
