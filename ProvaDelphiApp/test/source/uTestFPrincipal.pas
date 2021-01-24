unit uTestFPrincipal;

interface
uses
  DUnitX.TestFramework, uPrincipal;

type

  [TestFixture]
  TTestfPrincipal = class(TObject)
  private
    FTestPrincipal : TufPrincipal;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure CriarForm;
  end;

implementation

uses
  Vcl.Forms, uTarefa1;

procedure TTestfPrincipal.Setup;
begin
  FTestPrincipal := TufPrincipal.Create(nil);
end;

procedure TTestfPrincipal.TearDown;
begin
  FTestPrincipal.Free;
end;

procedure TTestfPrincipal.CriarForm;
var aForm : TForm;
begin
  aForm := FTestPrincipal.CriarForm(TufTarefa1,nil);
  Assert.IsTrue(Assigned(aForm), 'Form não criado');
  Assert.IsTrue(aForm.ClassType = TufTarefa1 , 'Classe do formulario incorreta');
  aForm.Free;
end;


initialization
  TDUnitX.RegisterTestFixture(TTestfPrincipal);
end.
