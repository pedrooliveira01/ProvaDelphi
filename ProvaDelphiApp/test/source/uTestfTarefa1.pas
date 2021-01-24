unit uTestfTarefa1;

interface
uses
  DUnitX.TestFramework, Vcl.Forms, utarefa1;

type

  [TestFixture]
  TTestfTarefa1 = class(TObject)
  private
    FTestfTarefa1 : TufTarefa1;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure GeraSQL;
  end;

implementation

uses
  System.SysUtils;

procedure TTestfTarefa1.GeraSQL;
  procedure AddSelect;
  Begin
    FTestfTarefa1.Clear;
    FTestfTarefa1.memoColunas.Lines.Add('Field1');
    FTestfTarefa1.memoColunas.Lines.Add('Field2');
    FTestfTarefa1.memoTabelas.Lines.Add('Tabela');
    FTestfTarefa1.memoCondicoes.Lines.Add('Field1=1');
  End;
  var aEsperado, aResult : String;
begin
  aEsperado := 'SELECT Field1, Field2 FROM Tabela WHERE Field1=1';
  AddSelect;
  FTestfTarefa1.btnGeraSQLClick(nil);
  aResult := trim(FTestfTarefa1.memoSQL.Lines.text);

  Assert.IsTrue(aEsperado = aResult, 'Esperado: ['+ aEsperado +']' + ' Gerado: ['+ aResult +']');

end;

procedure TTestfTarefa1.Setup;
begin
  FTestfTarefa1 := TufTarefa1.Create(nil);
end;

procedure TTestfTarefa1.TearDown;
begin
  FTestfTarefa1.free;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestfTarefa1);
end.
